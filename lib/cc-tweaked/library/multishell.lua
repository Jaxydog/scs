--- [Official Documentation](https://tweaked.cc/module/multishell.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/multishell.html)
---
--- Multishell allows multiple programs to be run at the same time.
---
--- When multiple programs are running, it displays a tab bar at the top of the screen,
--- which allows you to switch between programs. New programs can be launched using the `fg` or `bg` programs,
--- or using the `shell.openTab` and `multishell.launch` functions.
---
--- Each process is identified by its ID, which corresponds to its position in the tab list.
--- As tabs may be opened and closed, this ID is not constant over a program's run.
--- As such, be careful not to use stale IDs.
---
--- As with `shell`, `multishell` is not a 'true' API. Instead, it is a standard program, which launches a shell
--- and injects its API into the shell's environment. This API is not available in the global environment,
--- and so is not available to APIs.
---
--- # Changes
---
--- - New in version 1.6
multishell = {}

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:getFocus)
---
--- Get the currently visible process. This will be the one selected on the tab bar.
---
--- Note, this is different to `getCurrent`, which returns the process which is currently executing.
---
--- @return integer index The currently visible process' index.
---
--- @see multishell.setFocus()
function multishell.getFocus() end

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:setFocus)
---
--- Change the currently visible process.
---
--- @param n integer The process index to switch to.
---
--- @return boolean success If the process was changed successfully.
--- This will return `false` if there is no process with this ID.
---
--- @see multishell.getFocus()
function multishell.setFocus(n) end

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:getTitle)
---
--- Get the title of the given tab.
---
--- This starts as the name of the program, but may be changed using `multishell.setTitle`.
---
--- @param n integer The process index.
---
--- @return string? title The current process title, or `nil` if the process doesn't exist.
---
--- @see multishell.setTitle()
function multishell.getTitle(n) end

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:setTitle)
---
--- Set the title of the given process.
---
--- # Usage
---
--- - Change the title of the current process.
---
--- ```lua
--- multishell.setTitle(multishell.getCurrent(), 'Hello')
--- ```
---
--- @param n integer The process index.
--- @param title string The new process title.
---
--- @see multishell.getTitle()
function multishell.setTitle(n, title) end

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:getCurrent)
---
--- Get the index of the currently running process.
---
--- @return integer index The currently running process.
function multishell.getCurrent() end

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:launch)
---
--- Start a new process, with the given environment, program, and arguments.
---
--- The returned process index is not constant over the program's run.
--- It can be safely used immediately after launching (for instance, to update the title or switch to that tab).
--- However, after your program has yielded, it may no longer be correct.
---
--- # Usage
---
--- - Run the 'hello' program, and set its title to 'Hello!'.
---
--- ```lua
--- local id = multishell.launch({}, '/rom/programs/fun/hello.lua')
---
--- multishell.setTitle(id, 'Hello!')
--- ```
---
--- @param tProgramEnv table The environment to load the path under.
--- @param sProgramPath string The path to the program to run.
--- @param ... any Additional arguments to pass to the program.
---
--- @return integer index The index of the created process.
---
--- @see os.run()
function multishell.launch(tProgramEnv, sProgramPath, ...) end

--- [Official Documentation](https://tweaked.cc/module/multishell.html#v:getCount)
---
--- Get the number of processes within this multishell.
---
--- @return integer count The number of processes.
function multishell.getCount() end
