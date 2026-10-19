--- [Official Documentation](https://tweaked.cc/library/cc.completion.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/library/cc.completion.html)
---
--- A collection of helper methods for working with input completion, such as required by `_G.read`.
---
--- # Changes
---
--- - New in version 1.85.0
local completion = {}

--- [Official Documentation](https://tweaked.cc/library/cc.completion.html#v:choice)
---
--- Complete from a choice of one or more strings.
---
--- # Usage
---
--- - Call `_G.read`, completing the names of various animals.
---
--- ```lua
--- local completion = require('cc.completion')
--- local animals = { 'dog', 'cat', 'lion', 'unicorn' }
---
--- read(nil, nil, function(text)
---     return completion.choice(text, animals)
--- end)
--- ```
---
--- @param text string The input string to complete.
--- @param choices string[] The list of choices to complete from.
--- @param addSpace? boolean Whether to add a space after the completed item.
---
--- @return string[] completions A list of suffixes of matching strings.
function completion.choice(text, choices, addSpace) end

--- [Official Documentation](https://tweaked.cc/library/cc.completion.html#v:peripheral)
---
--- Complete the name of a currently attached peripheral.
---
--- # Usage
---
--- - Call `_G.read`, completing the names of attached peripherals.
---
--- ```lua
--- local completion = require('cc.completion')
---
--- read(nil, nil, completion.peripheral)
--- ```
---
--- @param text string The input string to complete.
--- @param addSpace? boolean Whether to add a space after the completed name.
---
--- @return string[] completions A list of suffixes of matching peripherals.
function completion.peripheral(text, addSpace) end

--- [Official Documentation](https://tweaked.cc/library/cc.completion.html#v:side)
---
--- Complete the side of a computer.
---
--- # Usage
---
--- - Call `_G.read`, completing the names of the computer's sides.
---
--- ```lua
--- local completion = require('cc.completion')
---
--- read(nil, nil, completion.side)
--- ```
---
--- @param text string The input string to complete.
--- @param addSpace? boolean boolean Whether to add a space after the completed side.
---
--- @return string[] completions A list of suffixes of matching sides.
function completion.side(text, addSpace) end

--- [Official Documentation](https://tweaked.cc/library/cc.completion.html#v:setting)
---
--- Complete a setting.
---
--- # Usage
---
--- - Call `_G.read`, completing the names of the computer's settings.
---
--- ```lua
--- local completion = require('cc.completion')
---
--- read(nil, nil, completion.setting)
--- ```
---
--- @param text string The input string to complete.
--- @param addSpace? boolean Whether to add a space after the completed settings.
---
--- @return string[] completions A list of suffixes of matching settings.
function completion.setting(text, addSpace) end

--- [Official Documentation](https://tweaked.cc/library/cc.completion.html#v:command)
---
--- Complete the name of a Minecraft command.
---
--- # Usage
---
--- - Call `_G.read`, completing the names of Minecraft commands.
---
--- ```lua
--- local completion = require('cc.completion')
---
--- read(nil, nil, completion.command)
--- ```
---
--- @param text string The input string to complete.
--- @param addSpace? boolean Whether to add a space after the completed command.
---
--- @return string[] completions A list of suffixes of matching commands.
function completion.command(text, addSpace) end

return completion
