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
local contents = file.readAll() or ''
file.close()

--- Tracks the program's state.
local state = {
    --- If `true`, the program should exit immediately.
    quit = false,
    --- An array of lines that should be displayed.
    lines = imports.strings.split(contents, '\n', true),
    --- The maximum length of any single line in the `lines` array.
    ---
    --- This is used when wrapping is disabled to determine how far the user is allowed to scroll rightwards.
    maxLineLength = 0,
    --- The current scrolling position.
    scroll = {
        --- The X scroll position.
        x = 0,
        --- The Y scroll position.
        y = 0,
    },
    --- Tracks the current state of relevant modifier keys.
    modifiers = {
        --- Either left-alt or right-alt are being held.
        alt = false,
        --- Either left-control or right-control are being held.
        control = false,
        --- Either left-shift or right-shift are being held.
        shift = false,
    },
}

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

        local filename = fs.getName(arguments[1])

        if filename:len() > width - positionLength then
            --- Truncate and add an ellipses to the filename if it's too long.
            filename = filename:sub(1, width - positionLength - 3) .. '...'
        end

        term.write(('%s %s'):format(imports.strings.ensure_width(filename, width - positionLength), position))

        term.setTextColor(colors.white)
        term.setBackgroundColor(colors.black)
    end

    return skipPagination
end

--- Handles a `key_up` event.
local function handleKeyUp()
    local _, key = os.pullEvent('key_up')

    if key == keys.leftAlt or key == keys.rightAlt then
        state.modifiers.alt = false
        -- Track alt state.
    elseif key == keys.leftCtrl or key == keys.rightCtrl then
        state.modifiers.control = false
        -- Track control state.
    elseif key == keys.leftShift or key == keys.rightShift then
        state.modifiers.shift = false
        -- Track shift state.
    elseif key == keys.q then
        state.quit = true
        -- Exit when `q` is pressed.
    elseif key == keys.home then
        state.scroll.y = 0
        -- Scroll to the top of the buffer.
    elseif key == keys['end'] then
        state.scroll.y = #state.lines - 1
        -- Scroll to the bottom of the buffer.
    elseif key == keys.pageUp or (key == keys.up and state.modifiers.shift) then
        state.scroll.y = math.max(0, state.scroll.y - select(2, term.getSize()))
        -- Scroll up by a whole page.
    elseif key == keys.pageDown or (key == keys.down and state.modifiers.shift) then
        state.scroll.y = math.min(#state.lines - 1, state.scroll.y + select(2, term.getSize()))
        -- Scroll down by a whole page.
    end
end

--- Handles a `key` event.
local function handleKeyDown()
    local _, key, _held = os.pullEvent('key')

    if key == keys.leftAlt or key == keys.rightAlt then
        state.modifiers.alt = true
        -- Track alt state.
    elseif key == keys.leftCtrl or key == keys.rightCtrl then
        state.modifiers.control = true
        -- Track control state.
    elseif key == keys.leftShift or key == keys.rightShift then
        state.modifiers.shift = true
        -- Track shift state.
    elseif key == keys.up and not state.modifiers.shift then
        state.scroll.y = math.max(0, state.scroll.y - 1)
        -- Scroll up by a single row.
    elseif key == keys.down and not state.modifiers.shift then
        state.scroll.y = math.min(#state.lines - 1, state.scroll.y + 1)
        -- Scroll down by a single row.
    elseif key == keys.left then
        state.scroll.x = math.max(0, state.scroll.x - 1)
        -- Scroll left by half of a page.
    elseif key == keys.right then
        -- The step size, used to compute the upper bound.
        local step = math.floor(select(1, term.getSize()) / 2)
        local max = math.floor(state.maxLineLength / step)

        state.scroll.x = math.min(max, state.scroll.x + 1)
        -- Scroll right by half of a page.
    end
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
    parallel.waitForAny(handleKeyDown, handleKeyUp)

    -- Reset the terminal to prepare to redraw.
    term.setCursorPos(1, 1)

    -- Skip clearing the terminal unless we're about to exit.
    --
    -- We don't call this after the loop because if `display` breaks immediately we may not want to clear.
    --
    --- @diagnostic disable-next-line: unnecessary-if
    if state.quit then
        term.clear()
    end
until state.quit
