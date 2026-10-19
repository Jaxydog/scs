--- [Official Documentation](https://tweaked.cc/module/shell.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/shell.html)
---
--- The shell API provides access to CraftOS's command line interface.
---
--- It allows you to start programs, add completion for a program, and much more.
---
--- `shell` is not a "true" API. Instead, it is a standard program, which injects its API into the programs
--- that it launches. This allows for multiple shells to run at the same time, but means that the API is not available
--- in the global environment, and so is unavailable to other APIs.
---
--- # Programs and the program path.
---
--- When you run a command with the shell, either from the prompt or from Lua code, the shell API performs several
--- steps to work out which program to run:
---
--- 1. Firstly, the shell attempts to resolve aliases. This allows us to use multiple names for a single command.
--- For example, the `list` program has two aliases: `ls` and `dir`.
--- When you write `ls /rom`, that's expanded to `list /rom`.
---
--- 2. Next, the shell attempts to find where the program actually is. For this, it uses the program path.
--- This is a colon separated list of directories, each of which is checked to see if it contains the program.
---
--- `list` or `list.lua` doesn't exist in `.` (the current directory), so the shell now looks in `/rom/programs`,
--- where `list.lua` can be found!
---
--- 3. Finally, the shell reads the file and checks if the file starts with a `#!`.
--- This is a hashbang, which says that this file shouldn't be treated as Lua, but instead passed to another program,
--- the name of which should follow the `#!`.
---
--- # Changes
---
--- - Changed in version 1.103.0: Added support for hashbangs.
shell = {}

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:execute)
---
--- Run a program with the supplied arguments.
---
--- Unlike `shell.run`, each argument is passed to the program verbatim.
--- While `shell.run('echo', 'b c')` runs `echo` with `b` and `c`, `shell.execute('echo', 'b c')` runs
--- `echo` with a single argument `b c`.
---
--- # Usage
---
--- - Run `paint my-image` from within a program.
---
--- ```lua
--- shell.execute('paint', 'my-image')
--- ```
---
--- # Changes
---
--- - New in version 1.88.0
---
--- @param command string The program to execute.
--- @param ... string Arguments to the program.
---
--- @return boolean success Whether the program exited successfully.
function shell.execute(command, ...) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:run)
---
--- Run a program with the supplied arguments.
---
--- All arguments are concatenated together and then parsed as a command line. As a result,
--- `shell.run('program a b')` is the same as `shell.run('program', 'a', 'b')`.
---
--- # Usage
---
--- - Run `paint my-image` from within a program.
---
--- ```lua
--- shell.run('paint', 'my-image')
--- ```
---
--- # Changes
---
--- - Changed in version 1.80pr1: Programs now get their own environment instead of sharing the same one.
--- - Changed in version 1.83.0: `arg` is now added to the environment.
---
--- @see shell.execute()
function shell.run(...) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:exit)
---
--- Exit the current shell.
---
--- This does not terminate your program, it simply makes the shell terminate after your program has finished.
--- If this is the top-level shell, then the computer will be shut down.
function shell.exit() end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:dir)
---
--- Return the current working directory.
---
--- This is what is displayed before the `>` of the shell prompt, and is used by `shell.resolve` to
--- handle relative paths.
---
--- @return string dir The current working directory.
---
--- @see shell.setDir()
function shell.dir() end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:setDir)
---
--- Set the current working directory.
---
--- # Throws
---
--- - If the path does not exist or is not a directory.
---
--- # Usage
---
--- - Set the working directory to `'rom'`.
---
--- ```lua
--- shell.setDir('rom')
--- ```
---
--- @param dir string The new working directory.
function shell.setDir(dir) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:path)
---
--- Get the path where programs are located.
---
--- The path is composed of a list of directory names in a string, each separated by a colon (`:`).
--- For example, turtles will look in the current directory (`.`), `/rom/programs`, and `/rom/programs/turtle` folder,
--- making the path `.:/rom/programs:/rom/programs/turtle`.
---
--- @return string path The current shell's path.
---
--- @see shell.setPath()
function shell.path() end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:setPath)
---
--- Set the current program path.
---
--- Be careful to prefix directories with a `/`.
--- Otherwise, they will be searched for from the current directory, rather than the computer's root.
---
--- # Changes
---
--- - New in version 1.2
---
--- @param path string The new program path.
function shell.setPath(path) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:resolve)
---
--- Resolve a relative path to an absolute path.
---
--- The `fs` and `io` APIs work using absolute paths, and so we must convert any paths relative to the current
--- directory to absolute ones. This does nothing when the path starts with `/`.
---
--- # Usage
---
--- - Resolve `startup.lua` when in the `rom` folder.
---
--- ```lua
--- shell.setDir('rom')
---
--- print(shell.resolve('startup.lua')) -- 'rom/startup.lua'
--- ```
---
--- @param path string The path to resolve.
---
--- @return string path The resolved path.
function shell.resolve(path) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:resolveProgram)
---
--- Resolve a program, using the program path and list of aliases.
---
--- # Usage
---
--- - Locate the `hello` program.
---
--- ```lua
--- shell.resolveProgram('hello')
--- ```
---
--- # Changes
---
--- - New in version 1.2
--- - Changed in version 1.80pr1: Now searches for files with and without the `.lua` extension.
---
--- @param command string The name of the program.
---
--- @return string? path The absolute path to the program, or `nil` if it could not be found.
function shell.resolveProgram(command) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:programs)
---
--- Return a list of all programs on the path.
---
--- # Usage
---
--- - Print all (non-hidden) programs on the program path.
---
--- # Changes
---
--- - New in version 1.2
---
--- ```lua
--- textutils.tabulate(shell.programs())
--- ```
---
--- @param includeHidden? boolean Include hidden files. Namely, any which start with `.`.
---
--- @return string[] programs A list of available programs.
function shell.programs(includeHidden) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:complete)
---
--- Complete a shell command line.
---
--- This accepts an incomplete command, and completes the program name or arguments. For instance, `l` will be
--- completed to `ls`, and `ls ro` will be completed to `ls rom/`.
---
--- Completion handlers for your program may be registered with `shell.setCompletionFunction`.
---
--- # Changes
---
--- - New in version 1.74
---
--- @param sLine string The input to complete.
---
--- @return string[]? completions The list of possible completions.
---
--- @see read()
--- @see shell.completeProgram()
--- @see shell.setCompletionFunction()
--- @see shell.getCompletionInfo()
function shell.complete(sLine) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:completeProgram)
---
--- Complete the name of a program.
---
--- @param program string The name of a program to complete.
---
--- @return string[] completions A list of possible completions.
function shell.completeProgram(program) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:setCompletionFunction)
---
--- Set the completion function for a program.
--- When the program is entered on the command line, this program will be called to provide autocomplete information.
---
--- The completion function accepts four arguments:
---
--- 1. The current shell. As completion functions are inherited, this is not guaranteed to be the shell you
--- registered this function in.
---
--- 2. The index of the argument currently being completed.
---
--- 3. The current argument. This may be the empty string.
---
--- 4. A list of the previous arguments.
---
--- For instance, when completing `pastebin put rom/st` our pastebin completion function will receive the shell API,
--- an index of 2, `rom/st` as the current argument, and a "previous" table of `{ 'put' }`.
--- This function may then wish to return a table containing `artup.lua`, indicating the entire command should be
--- completed to `pastebin put rom/startup.lua`.
---
--- Your completion entries may also be followed by a space, if you wish to indicate another argument is expected.
---
--- # Changes
---
--- - New in version 1.74
---
--- @param program string The path to the program. This should be an absolute path without the leading `/`.
--- @param complete cc.shell.CompletionFunction The completion function.
---
--- @see read()
--- @see shell.complete()
function shell.setCompletionFunction(program, complete) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:getCompletionInfo)
---
--- Get a table containing all completion functions.
---
--- This should only be needed when building custom shells. Use `setCompletionFunction` to add a completion function.
---
--- @return table<string, cc.shell.CompletionFunction> mappings A table mapping the absolute path of programs
--- to their completion functions.
function shell.getCompletionInfo() end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:getRunningProgram)
---
--- Returns the path to the currently running program.
---
--- # Changes
---
--- - New in version 1.3
---
--- @return string path The absolute path to the running program.
function shell.getRunningProgram() end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:setAlias)
---
--- Add an alias for a program.
---
--- # Usage
---
--- - Alias `vim` to the `edit` program.
---
--- ```lua
--- shell.setAlias('vim', 'edit')
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param command string The name of the alias to add.
--- @param program string The name or path to the program.
function shell.setAlias(command, program) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:clearAlias)
---
--- Remove an alias.
---
--- @param command string The alias name to remove.
function shell.clearAlias(command) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:aliases)
---
--- Get the current aliases for this shell.
---
--- Aliases are used to allow multiple commands to refer to a single program.
--- For instance, the `list` program is aliased to `dir` or `ls`.
--- Running `ls`, `dir`, or `list` in the shell will all run the `list` program.
---
--- @return table<string, string> aliases A table, where the keys are the names of aliases, and the values are
--- the path to the program.
---
--- @see shell.setAlias()
--- @see shell.resolveProgram()
function shell.aliases() end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:openTab)
---
--- Open a new `multishell` tab running a command.
---
--- This behaves similarly to `shell.run`, but instead returns the process index.
---
--- This function is only available if the `multishell` API is.
---
--- # Usage
---
--- - Launch the Lua interpreter and switch to it.
---
--- ```lua
--- local id = shell.openTab('lua')
---
--- shell.switchTab(id)
--- ```
---
--- # Changes
---
--- - New in version 1.6
---
--- @param ... string The command-line to run.
---
--- @return integer id The ID of the new tab that was opened.
---
--- @see multishell.launch()
--- @see shell.run()
function shell.openTab(...) end

--- [Official Documentation](https://tweaked.cc/module/shell.html#v:switchTab)
---
--- Switch to the `multishell` tab with the given index.
---
--- # Changes
---
--- - New in version 1.6
---
--- @param id integer The tab to switch to.
---
--- @see multishell.setFocus()
function shell.switchTab(id) end
