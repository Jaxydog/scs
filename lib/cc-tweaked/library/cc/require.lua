--- [Official Documentation](https://tweaked.cc/library/cc.require.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/library/cc.require.html)
---
--- A pure Lua implementation of the builtin `require` function and `package` library.
---
--- Generally you do not need to use this module - it is injected into the every program's environment.
--- However, it may be useful when building a custom shell or when running programs yourself.
---
--- # Usage
---
--- - Construct the package and require function, and insert them into a custom environment.
---
--- ```lua
--- local r = require('cc.require')
--- local env = setmetatable({}, { __index = _ENV })
---
--- env.require, env.package = r.make(env, '/')
---
--- print(r, env.require('cc.require'))
--- ```
---
--- # Changes
---
--- - New in version 1.88.0
local require = {}

--- [Official Documentation](https://tweaked.cc/library/cc.require.html#v:make)
---
--- Build an implementation of Lua's `package` library, and a `require` function to load modules within it.
---
--- @param env table The environment to load packages into.
--- @param dir string The directory that relative packages are loaded from.
---
--- @return fun(modname: string): any require The new require function.
--- @return packagelib package The new package library.
function require.make(env, dir) end

return require
