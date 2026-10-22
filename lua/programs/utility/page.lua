local imports = {
    strings = require('cc.strings'),
}

--- If `true`, lines will be cut off at the right-hand side of the screen, and the user may scroll left and right.
--- If `false`, lines will be wrapped around the right-hand side of the screen on word boundaries.
local disableWrapping = scs.settings.new('scs.programs.utility.page.disable_wrapping', {
    type = 'boolean',
    default = true,
    description = 'Disables line wrapping for the `page` program',
}) --- @as scs.settings.Setting<boolean>

local arguments = { ... }

if #arguments == 0 then
    local programName = arg[0] or fs.getName(shell.getRunningProgram())

    print(('Usage: %s <path>'):format(programName))

    return
end

local path = shell.resolve(arguments[1])

if not fs.exists(path) then
    error('File does not exist', 0)
elseif fs.isDir(path) then
    error('Path is a directory', 0)
end

local file = assert(fs.open(path, 'r'))
local contents = file.readAll()
file.close()

--- Tracks the program's state.
local state = {
    --- If `true`, the program should exit immediately.
    ---
    --- @type boolean
    quit = false,
    --- An array of lines that should be displayed.
    ---
    --- @type string[]
    lines = imports.strings.split(contents or '', '\n', true),
    --- The maximum length of any single line in the `lines` array.
    ---
    --- This is used when wrapping is disabled to determine how far the user is allowed to scroll rightwards.
        ---
        --- @type integer
    maxLineLength = 0,
    --- The current scrolling position.
    scroll = {
        --- The X scroll position.
        ---
        --- @type integer
        x = 0,
        --- The Y scroll position.
        ---
        --- @type integer
        y = 0,
    },
    --- Tracks internal state related to word searching.
    search = {
        --- Whether all character input should be captured to the internal buffer.
        --- 
        --- @type boolean
        capture = false,
        --- The current search buffer.
        ---
        --- @type string
        buffer = '',
        --- A list of result locations, sorted by their relative position.
        --- 
        --- @type { x: integer, y: integer, length: integer }[]
        results = {},
        --- The current search index.
        ---
        --- @type integer
        current = 1,
    },
    --- Highlights a section of text.
    highlight = {
        --- The X position.
        ---
        --- @type integer
        x = 1,
        --- The Y position.
        ---
        --- @type integer
        y = 1,
        --- The length of the highlighted section.
        ---
        --- @type integer
        length = 0,
    },
    --- Tracks the current state of relevant modifier keys.
    modifiers = {
        --- Either left-alt or right-alt are being held.
        ---
        --- @type boolean
        alt = false,
        --- Either left-control or right-control are being held.
        ---
        --- @type boolean
        control = false,
        --- Either left-shift or right-shift are being held.
        ---
        --- @type boolean
        shift = false,
    },
}

contents = nil

if disableWrapping:get() then
    -- This is only computed if wrapping is disabled to save on program startup time.
    --
    -- Also, `maxLineLength` being zero effectively disables horizontal scrolling.
    for _, line in ipairs(state.lines) do
        state.maxLineLength = math.max(state.maxLineLength, line:len())
    end
else
    -- This wraps all lines around the current width of the terminal.
    --
    -- This means that, in cases where this program is run and the terminal size changes, text may no longer align
    -- with the screen's size.
    --
    -- TO-DO: adjust this wrap implementation so that it is size-aware during runtime.
    local wrappedLines = {}
    local width = term.getSize()

    for _, line in ipairs(state.lines) do
        for _, wrappedLine in ipairs(imports.strings.wrap(line, width)) do
            wrappedLines[#wrappedLines + 1] = wrappedLine
        end
    end

    state.lines = wrappedLines
end

-- The `strings.split` function leaves an empty string at the end in some cases, so we trim it for brevity.
if state.lines[#state.lines] == '' then
    state.lines[#state.lines] = nil
end

--- Display the current section of the file's contents.
---
--- @return boolean skipPagination Whether the program should exit immediately.
local function display()
    local width, height = term.getSize()

    -- If the text can be displayed on the current terminal without needing to scroll, we can exit immediately when
    -- this function call is finished.
    local skipPagination = #state.lines < height and state.maxLineLength <= width

    -- The `x` position is scrolled by half of the width at a time, rather than a single cell like the `y` position.
    local x = 1 + (state.scroll.x * math.floor(width / 2))
    local y = 1 + state.scroll.y

    local buffer = ''

    for index = y, math.min(#state.lines, state.scroll.y + (height - 1)) do
        -- Lines will be pre-wrapped if wrapping is enabled, so this `ensure_width` call will do nothing if lines are
        -- being wrapped.
        local line = imports.strings.ensure_width((state.lines[index] or ''):sub(x), width)

        if buffer == '' then
            buffer = line
        else
            buffer = buffer .. '\n' .. line
        end
    end

    -- We use a buffer here to use a single `print` call because having many `print` calls can be expensive.
    print(buffer)

    if not skipPagination then
        --- A line of gradient characters used when rendering past the end of a file.
        local block = ('\x7F'):rep(width)

        buffer = ''

        for _ = 1, height - select(2, term.getCursorPos()) do
            if buffer == '' then
                buffer = block
            else
                buffer = buffer .. '\n' .. block
            end
        end

        -- Skip printing if we haven't reached the end of the file.
        if buffer ~= '' then
            term.setBackgroundColor(colors.gray)
            term.setTextColor(colors.black)

            print(buffer)
        end

        term.setTextColor(colors.black)
        term.setBackgroundColor(colors.lightGray)

        local position = ('%d:%d'):format(x, y)
        -- We add one to ensure there is always at least one character of space before the position string.
        local positionLength = position:len() + 1

        local text

        if state.search.buffer == '' and not state.search.capture then
            local filename = fs.getName(arguments[1])

            if filename:len() > width - positionLength then
                --- Truncate and add an ellipses to the filename if it's too long.
                text = filename:sub(1, width - positionLength - 3) .. '...'
            else
                text = filename
            end
        else
            text = state.search.buffer .. (state.search.capture and '_' or '')
        end

        term.write(('%s %s'):format(imports.strings.ensure_width(text, width - positionLength), position))

        if state.highlight.length > 0 then
            local pageX = state.highlight.x - (state.scroll.x * math.floor(width / 2))
            local pageY = state.highlight.y - state.scroll.y

            if 0 < pageX and pageX <= width and 0 < pageY and pageY <= height then
                local highlightText = (state.lines[state.highlight.y] or '')

                term.setCursorPos(pageX, pageY)
                term.setTextColor(colors.white)
                term.setBackgroundColor(colors.gray)

                term.write(highlightText:sub(state.highlight.x, state.highlight.x + state.highlight.length))
            end
        end

        term.setTextColor(colors.white)
        term.setBackgroundColor(colors.black)
    end

    return skipPagination
end

--- Search for the current buffer.
local function search()
    if state.search.buffer == '' then return {} end

    --- @type { x: integer, y: integer, length: integer } []
    local results = {}

    for y, line in ipairs(state.lines) do
        local initial = 0 --- @as integer?

        while initial ~= nil do
            local start, stop = line:find(state.search.buffer, initial)

            if start ~= nil then
                --- @cast stop -?
                results[#results + 1] = { x = start, y = y, length = stop - start }
            end

            initial = stop
        end
    end

    return results
end

--- Moves the current scroll location to the given coordinate.
---
--- @param x integer The X position.
--- @param y integer The Y position.
--- @param length? integer The length of section to highlight. If `nil`, nothing will be highlighted.
local function relocate(x, y, length)
    -- The horizontal step size, used to compute the horizontal scroll.
    local step = math.floor(select(1, term.getSize()) / 2)
    local max = math.floor(state.maxLineLength / step)

    state.scroll.x = math.max(0, math.min(max, math.floor(x / step) - 1))
    state.scroll.y = math.max(0, math.min(#state.lines, y - 1))

    if length ~= nil then
        state.highlight = { x = x, y = y, length = length }
    end
end

--- Handles a key event.
local function handleKey()
    local data = {}

    parallel.waitForAny(
        function() data = { os.pullEvent('key') } end, --
        function() data = { os.pullEvent('key_up') } end
    )

    --- @type cc.os.Event, integer
    local event, key = table.unpack(data)
    local down = event == 'key'

    if key == keys.leftAlt or key == keys.rightAlt then
        state.modifiers.alt = down
        return
    end
    if key == keys.leftCtrl or key == keys.rightCtrl then
        state.modifiers.control = down
        return
    end
    if key == keys.leftShift or key == keys.rightShift then
        state.modifiers.shift = down
        return
    end

    if state.search.capture then
        if not down and key == keys.enter then
            state.search.capture = false
            state.search.results = search()
            state.search.current = 1

            if #state.search.results > 0 then
                local position = assert(state.search.results[1])

                relocate(position.x, position.y, position.length)
            end

            return
        end
        if down and key == keys.backspace then
            state.search.buffer = state.search.buffer:sub(1, -2)
            return
        end

        return
    end

    if not down and key == keys.q then
        state.quit = true
        return
    end
    if not down and key == keys.slash then
        state.search.capture = true
        state.search.buffer = ''
        state.search.results = {}
        return
    end

    if not down and key == keys.home then
        state.scroll.y = 0
        return
    end
    if not down and key == keys['end'] then
        state.scroll.y = #state.lines - 1
        return
    end

    if not down and (key == keys.pageUp or (state.modifiers.shift and key == keys.up)) then
        state.scroll.y = math.max(0, state.scroll.y - select(2, term.getSize()))
        return
    end
    if not down and (key == keys.pageDown or (state.modifiers.shift and key == keys.down)) then
        state.scroll.y = math.min(#state.lines - 1, state.scroll.y + select(2, term.getSize()))
        return
    end

    if down and key == keys.up and not state.modifiers.shift then
        state.scroll.y = math.max(0, state.scroll.y - 1)
        return
    end
    if down and key == keys.down and not state.modifiers.shift then
        state.scroll.y = math.min(#state.lines - 1, state.scroll.y + 1)
        return
    end
    if down and key == keys.left then
        state.scroll.x = math.max(0, state.scroll.x - 1)
        return
    end
    if down and key == keys.right then
        -- The step size, used to compute the upper bound.
        local step = math.floor(select(1, term.getSize()) / 2)
        local max = math.floor(state.maxLineLength / step)

        state.scroll.x = math.min(max, state.scroll.x + 1)
        return
    end

    if #state.search.results > 0 then
        if not down and key == keys.n then
            if state.modifiers.shift then
                if state.search.results[state.search.current - 1] == nil then return end

                state.search.current = state.search.current - 1
            else
                if state.search.results[state.search.current + 1] == nil then return end

                state.search.current = state.search.current + 1
            end

            local position = assert(state.search.results[state.search.current])

            relocate(position.x, position.y, position.length)
        end
    end
end

--- Handles a character event.
local function handleCharacter()
    local character = nil

    -- Discard any characters until we're supposed to capture.
    repeat
        character = select(2, os.pullEvent('char'))
    until state.search.capture

    state.search.buffer = state.search.buffer .. character
end

-- We can't assume that colors are correct when the program is run.
term.setTextColor(colors.white)
term.setBackgroundColor(colors.black)

repeat
    -- Exit immediately if pagination is not required.
    if display() then break end

    -- Wait for the next key event.
    --
    -- Since we're rendering static content, there's no need to render unless there's a reason to update.
    parallel.waitForAny(handleKey, handleCharacter)

    -- Reset the terminal to prepare to redraw.
    term.setCursorPos(1, 1)

    -- Skip clearing the terminal unless we're about to exit.
    --
    -- We don't call this after the loop because if `display` breaks immediately we may not want to clear.
    if state.quit then
        term.clear()
    end
until state.quit
