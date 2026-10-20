--- [Official Documentation](https://tweaked.cc/library/cc.expect.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/library/cc.expect.html)
---
--- The `cc.expect` library provides helper functions for verifying that function arguments are well-formed and
--- of the correct type.
---
--- # Usage
---
--- - Define a basic function and check it has the correct arguments.
---
--- ```lua
--- local expect = require('cc.expect')
--- local expect, field = expect.expect, expect.field
---
--- local function add_person(name, info)
---     expect(1, name, 'string')
---     expect(2, info, 'table', 'nil')
---
---     if info then
---         print('Got age=', field(info, 'age', 'number'))
---         print('Got gender=', field(info, 'gender', 'string', 'nil'))
---     end
--- end
---
--- add_person('Anastazja')
--- add_person('Kion', { age = 23 })
--- add_person('Caoimhin', { age = 23, gender = true })
--- ```
---
--- # Changes
---
--- - New in version 1.84.0
--- - Changed in version 1.96.0: The module can now be called directly as a function, which wraps around `expect.expect`.
local expect = {}

--- [Official Documentation](https://tweaked.cc/library/cc.expect.html#v:expect)
---
--- Expect an argument to have a specific type.
---
--- # Throws
---
--- - If the value is not one of the allowed types.
---
--- @generic T
---
--- @param index integer The 1-based argument index.
--- @param value T The argument's value.
--- @param ... type The allowed types of the argument.
---
--- @return T value The given value.
function expect.expect(index, value, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.expect.html#v:field)
---
--- Expect a field to have a specific type.
---
--- # Throws
---
--- - If the field is not one of the allowed types.
---
--- @param tbl table The table to index.
--- @param index string The field name to check.
--- @param ... type The allowed types of the argument.
---
--- @return unknown field The contents of the given field.
function expect.field(tbl, index, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.expect.html#v:range)
---
--- Expect a number to be within a specific range.
---
--- # Throws
---
--- - If the value is outside of the allowed range.
---
--- # Changes
---
--- - New in version 1.96.0
---
--- @param number number The value to check.
--- @param min? number The minimum value (default `-math.huge`).
--- @param max? number The maximum value (default `math.huge`).
---
--- @return number value The given `value`.
function expect.range(number, min, max) end

return expect
