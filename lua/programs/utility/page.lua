local imports = {
    strings = require('cc.strings'),
}

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

local state = {
    quit = false,
    lines = imports.strings.split(contents, '\n', true),
    maxLineLength = 0,
    scroll = {
        x = 0,
        y = 0,
    },
    modifiers = {
        alt = false,
        control = false,
        shift = false,
    },
}

if disableWrapping:get() then
    for _, line in ipairs(state.lines) do
        state.maxLineLength = math.max(state.maxLineLength, line:len())
    end
else
    local wrappedLines = {}
    local width = term.getSize()

    for _, line in ipairs(state.lines) do
        for _, wrappedLine in ipairs(imports.strings.wrap(line, width)) do
            wrappedLines[#wrappedLines + 1] = wrappedLine
        end
    end

    state.lines = wrappedLines
end

if state.lines[#state.lines] == '' then
    state.lines[#state.lines] = nil
end

local function display()
    local width, height = term.getSize()
    local cleanExit = #state.lines < height and state.maxLineLength <= width

    local xOffset = math.max(0, state.scroll.x)
    local yOffset = math.max(0, state.scroll.y)

    local indexStart = 1 + yOffset
    local indexEnd = math.min(#state.lines, height + yOffset - 1)

    local buffer = ''

    for index = indexStart, indexEnd, 1 do
        local line = state.lines[index] or ''

        line = imports.strings.ensure_width(line:sub(1 + (xOffset * width)), width)

        if buffer == '' then
            buffer = line
        else
            buffer = buffer .. '\n' .. line
        end
    end

    print(buffer)

    if not cleanExit then
        local _, y = term.getCursorPos()
        local block = ('\x7F'):rep(width)

        buffer = ''

        for _ = 1, height - y do
            if buffer == '' then
                buffer = block
            else
                buffer = buffer .. '\n' .. block
            end
        end

        if buffer ~= '' then
            term.setBackgroundColor(colors.gray)
            term.setTextColor(colors.black)

            print(buffer)
        end

        term.setTextColor(colors.black)
        term.setBackgroundColor(colors.lightGray)

        local navigation = ('%d:%d'):format(xOffset, yOffset)
        local navigationSize = navigation:len() + 1

        local filename = fs.getName(arguments[1])

        if filename:len() > width - navigationSize then
            filename = filename:sub(1, width - navigationSize - 3) .. '...'
        end

        term.write(('%s %s'):format(imports.strings.ensure_width(filename, width - navigationSize), navigation))
        term.setTextColor(colors.white)
        term.setBackgroundColor(colors.black)
    end

    return cleanExit
end

local function handleKeyUp()
    local _, key = os.pullEvent('key_up')

    if key == keys.leftAlt or key == keys.rightAlt then
        state.modifiers.alt = false
    elseif key == keys.leftCtrl or key == keys.rightCtrl then
        state.modifiers.control = false
    elseif key == keys.leftShift or key == keys.rightShift then
        state.modifiers.shift = false
    elseif key == keys.q then
        state.quit = true
    elseif key == keys.home then
        state.scroll.y = 0
    elseif key == keys['end'] then
        state.scroll.y = #state.lines - 1
    elseif key == keys.pageUp or (key == keys.up and state.modifiers.shift) then
        state.scroll.y = math.max(0, state.scroll.y - select(2, term.getSize()))
    elseif key == keys.pageDown or (key == keys.down and state.modifiers.shift) then
        state.scroll.y = math.min(#state.lines - 1, state.scroll.y + select(2, term.getSize()))
    end
end

local function handleKeyDown()
    local _, key, _held = os.pullEvent('key')

    if key == keys.leftAlt or key == keys.rightAlt then
        state.modifiers.alt = true
    elseif key == keys.leftCtrl or key == keys.rightCtrl then
        state.modifiers.control = true
    elseif key == keys.leftShift or key == keys.rightShift then
        state.modifiers.shift = true
    elseif key == keys.up and not state.modifiers.shift then
        state.scroll.y = math.max(0, state.scroll.y - 1)
    elseif key == keys.down and not state.modifiers.shift then
        state.scroll.y = math.min(#state.lines - 1, state.scroll.y + 1)
    elseif key == keys.left then
        state.scroll.x = math.max(0, state.scroll.x - 1)
    elseif key == keys.right then
        state.scroll.x = math.min(math.floor(state.maxLineLength / select(1, term.getSize())), state.scroll.x + 1)
    end
end

repeat
    if display() then break end

    parallel.waitForAny(handleKeyDown, handleKeyUp)

    term.clear()
    term.setCursorPos(1, 1)
until state.quit
