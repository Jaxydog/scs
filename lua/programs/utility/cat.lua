local disablePagination = scs.settings.new('scs.programs.utility.cat.disable_pagination', {
    type = 'boolean',
    default = false,
    description = 'Disables pagination for the `cat` program',
}) --- @as scs.settings.Setting<boolean>

local arguments = { ... }

if #arguments == 0 then
    local programName = arg[0] or fs.getName(shell.getRunningProgram())

    print(('Usage: %s <path>'):format(programName))

    return
end

if not disablePagination:get() then
    shell.run('page', arguments[1])

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

print(contents)
