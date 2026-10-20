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

shell.setCompletionFunction(fs.combine(root, '/programs/utility/cat.lua'), complete.build(complete.file))

_G.scs = {
    settings = require('rom.settings'),
}
