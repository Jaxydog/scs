--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html)
---
--- A collection of helper methods for working with shell completion.
---
--- Most programs may be completed using the `build` helper method, rather than manually switching on
--- the argument index.
---
--- Note, the helper functions within this module do not accept an argument index, and so are not directly usable
--- with the `shell.setCompletionFunction`. Instead, wrap them using `build`, or your own custom function.
---
--- # Usage
---
--- - Register a completion handler for `example.lua` which prompts for a choice of options, followed by a
--- directory, and then multiple files.
---
--- ```lua
--- local completion = require('cc.shell.completion')
--- local complete = completion.build(
---     { completion.choice, { 'get', 'put' } },
---     completion.dir,
---     { completion.file, many = true }
--- )
---
--- shell.setCompletionFunction('example.lua', complete)
---
--- read(nil, nil, shell.complete, 'example ')
--- ```
---
--- # Changes
---
--- - New in version 1.85.0
local completion = {}

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:file)
---
--- Complete the name of a file relative to the current working directory.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
---
--- @return string[] completions A list of suffixes of matching files.
function completion.file(shell, text) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:dir)
---
--- Complete the name of a directory relative to the current working directory.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
---
--- @return string[] completions A list of suffixes of matching directories.
function completion.dir(shell, text) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:dirOrFile)
---
--- Complete the name of a file or directory relative to the current working directory.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
---
--- @return string[] completions A list of suffixes of matching files and directories.
function completion.dirOrFile(shell, text) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:program)
---
--- Complete the name of a program.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
---
--- @return string[] completions A list of suffixes of matching programs.
---
--- @see shell.completeProgram()
function completion.program(shell, text) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:programWithArgs)
---
--- Complete arguments of a program.
---
--- # Changes
---
--- - New in version 1.97.0
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param starting integer Which argument index this program and arguments start at.
---
--- @return string[] completions A list of suffixes of matching programs or arguments.
function completion.programWithArgs(shell, text, previous, starting) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:help)
---
--- Wraps `help.completeTopic` as a `build`-compatible function.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param ... any Additional arguments to the function.
---
--- @return string[] completions A list of suffixes.
function completion.help(shell, text, previous, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:choice)
---
--- Wraps `cc.completion.choice` as a `build`-compatible function.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param ... any Additional arguments to the function.
---
--- @return string[] completions A list of suffixes.
function completion.choice(shell, text, previous, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:peripheral)
---
--- Wraps `cc.completion.peripheral` as a `build`-compatible function.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param ... any Additional arguments to the function.
---
--- @return string[] completions A list of suffixes.
function completion.peripheral(shell, text, previous, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:side)
---
--- Wraps `cc.completion.side` as a `build`-compatible function.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param ... any Additional arguments to the function.
---
--- @return string[] completions A list of suffixes.
function completion.side(shell, text, previous, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:setting)
---
--- Wraps `cc.completion.setting` as a `build`-compatible function.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param ... any Additional arguments to the function.
---
--- @return string[] completions A list of suffixes.
function completion.setting(shell, text, previous, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:command)
---
--- Wraps `cc.completion.command` as a `build`-compatible function.
---
--- @param shell table The shell we're completing in.
--- @param text string Current text to complete.
--- @param previous string[] The shell arguments before this one.
--- @param ... any Additional arguments to the function.
---
--- @return string[] completions A list of suffixes.
function completion.command(shell, text, previous, ...) end

--- [Official Documentation](https://tweaked.cc/library/cc.shell.completion.html#v:build)
---
--- A helper function for building shell completion arguments.
---
--- This accepts a series of single-argument completion functions, and combines them into a function suitable for use
--- with `shell.setCompletionFunction`.
---
--- Every argument to build represents an argument to the program you wish to complete.
--- Each argument can be one of three types:
---
--- - `nil`: This argument will not be completed.
---
--- - A function: This argument will be completed with the given function. It is called with the `shell` object, the
--- string to complete, and the arguments before this one.
---
--- - A table: This acts as a more powerful version of the function case. The table must have a function as the
--- first item - this will be called with the `shell`, string and preceding arguments as above, but also followed
--- by any additional items in the table. This provides a more convenient interface to pass options to your
--- completion functions.
---
--- If this table is the last argument, it may also set the `many` key to `true`, which states this function should be
--- used to complete any remaining arguments.
---
--- @param ... nil | table | function The completion function for an argument.
---
--- @return fun(shell: table, index: integer, text: string, previous: string[]): string[]
function completion.build(...) end

return completion
