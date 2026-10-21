if settings.get('scs.test', false) == true then
    _G._SCS_TESTING = true
else
    _G._SCS_TESTING = false
end

local root = settings.get('scs.root', '/.scs-root') --- @as string

if root:sub(1, 1) ~= '/' then
    root = '/' .. root
end
if root:sub(-1, -1) == '/' then
    root = root:sub(1, -2)
end

package.path = ('%s;%s/?.lua'):format(package.path, root)

local path = ('%s:%s/programs'):format(shell.path(), root)

for _, programPath in ipairs(fs.list(fs.combine(root, 'programs'))) do
    local absolutePath = fs.combine(root, 'programs', programPath)

    if fs.isDir(absolutePath) then
        path = ('%s:/%s'):format(path, absolutePath)
    end
end

shell.setPath(path)

local complete = require('cc.shell.completion')

--- Registers a completion function for the given program, throwing an error if it does not exist.
---
--- @param program string The program name.
--- @param completion cc.shell.CompletionFunction The completion function.
local function registerCompletionFunction(program, completion)
    local programPath = fs.combine(root, ('/programs/%s.lua'):format(program))

    if not fs.exists(programPath) then
        error(('unknown program %s'):format(program), 2)
    end

    shell.setCompletionFunction(programPath, completion)
end

registerCompletionFunction('utility/cat', complete.build(complete.file))
registerCompletionFunction('utility/page', complete.build(complete.file))

_G.scs = {
    settings = require('rom.settings'),
}
