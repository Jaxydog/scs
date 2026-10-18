--- [Official Documentation](https://tweaked.cc/module/os.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/os.html)
---
--- The `os` API allows interacting with the current computer.
os = {}

--- [Official Documentation](https://tweaked.cc/module/os.html#v:loadAPI)
---
--- > [!WARNING]
--- > When possible it's best to avoid using this function. It pollutes the global table and can mask errors.
--- >
--- > `require` should be used to load libraries instead.
---
--- Loads the given API into the global environment.
---
--- This function loads and executes the file at the given path, and all global variables and functions exported
--- by it will by available through the use of `myAPI.<function name>`, where `myAPI` is the base name of the API file.
---
--- # Changes
---
--- - New in version 1.2
---
--- @deprecated
---
--- @param path string The path of the API to load.
---
--- @return boolean success Whether or not the API was successfully loaded.
---
--- @see os.unloadAPI()
function os.loadAPI(path) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:unloadAPI)
---
--- > [!WARNING]
--- > See `os.loadAPI`.
---
--- Unloads an API which was loaded by `os.loadAPI`.
---
--- This effectively removes the specified table from `_G`.
---
--- # Changes
---
--- - New in version 1.2
---
--- @deprecated
---
--- @param name string The name of the API to unload.
---
--- @see os.loadAPI()
function os.unloadAPI(name) end

--- @attribute event(name: cc.os.Event, data: ...type)

--- [Official Documentation](https://tweaked.cc/module/os.html#v:pullEvent)
---
--- Pause execution of the current thread and waits for any events matching filter.
---
--- This function yields the current process and waits for it to be resumed with a vararg list where
--- the first element matches `filter`. If no `filter` is supplied, this will match all events.
---
--- Unlike `os.pullEventRaw`, it will stop the application upon a "terminate" event, printing the error "Terminated".
---
--- # Usage
---
--- - Listen for `mouse_click` events.
---
--- ```lua
--- while true do
---     local event, button, x, y = os.pullEvent('mouse_click')
---
---     print('Button', button, 'was clicked at', x, ',', y)
--- end
--- ```
---
--- - Listen for multiple events.
---
--- ```lua
--- while true do
---     local eventData = { os.pullEvent() }
---     local event = eventData[1]
---
---     if event == 'mouse_click' then
---         print('Button', eventData[2], 'was clicked at', eventData[3], ',', eventData[4])
---     elseif event == 'key' then
---         print('Key code', eventData[2], 'was pressed')
---     end
--- end
--- ```
---
--- # Changes
---
--- - Changed in version 1.3: Added filter argument.
---
--- @param filter? cc.os.Event The event to filter for.
---
--- @return cc.os.Event event The name of the event that fired.
--- @return unknown ... data Optional additional parameters of the event.
---
--- @see os.pullEventRaw()
function os.pullEvent(filter) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:pullEventRaw)
---
--- Pause execution of the current thread and waits for events, including the `terminate` event.
---
--- This behaves almost the same as `os.pullEvent`, except it allows you to handle the `terminate` event
--- yourself - the program will not stop execution when `Ctrl+T` is pressed.
---
--- # Changes
---
--- - Changed in version 1.3: Added filter argument.
---
--- @param filter? cc.os.Event The event to filter for.
---
--- @return cc.os.Event event The name of the event that fired.
--- @return unknown ... data Optional additional parameters of the event.
---
--- @see os.pullEvent()
function os.pullEventRaw(filter) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:sleep)
---
--- Pauses execution for the specified number of seconds, alias of `_G.sleep`.
---
--- @param time number The number of seconds to sleep for, rounded up to the nearest multiple of 0.05.
function os.sleep(time) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:version)
---
--- Get the current CraftOS version (for example, CraftOS 1.9).
---
--- This is defined by `bios.lua`. For the current version of CC:Tweaked, this should return `CraftOS 1.9`.
---
--- If you need to check for the presence of a feature, it is usually better to rely on feature detection,
--- rather than comparing CraftOS versions.
---
--- @return string version The current CraftOS version.
---
--- @see _G._HOST
function os.version() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:run)
---
--- Run the program at the given path with the specified environment and arguments.
---
--- This function does not resolve program names like the shell does.
--- This means that, for example, `os.run('edit')` will not work.
--- As well as this, it does not provide access to the `shell` API in the environment.
--- For this behavior, use `shell.run` instead.
---
--- If the program cannot be found, or failed to run, it will print the error and return `false`.
--- If you want to handle this more gracefully, use an alternative such as `loadfile`.
---
--- # Usage
---
--- - Run the default shell from within your program.
---
--- ```lua
--- os.run({}, '/rom/programs/shell.lua')
--- ```
---
--- @param env table The environment to run the program with.
--- @param path string The exact path of the program to run.
--- @param ... any The arguments to pass to the program.
---
--- @return boolean success Whether or not the program ran successfully.
---
--- @see shell.run()
--- @see loadfile()
function os.run(env, path, ...) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:queueEvent)
---
--- Adds an event to the event queue. This event can later be pulled with `os.pullEvent`.
---
--- @param name cc.os.Event The name of the event to queue.
--- @param ... unknown The parameters of the event.
---
--- These can be any primitive type (boolean, number, string) as well as tables.
--- Other types (like functions), as well as metatables, will not be preserved.
---
--- @see os.pullEvent()
function os.queueEvent(name, ...) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:startTimer)
---
--- Starts a timer that will run for the specified number of seconds.
--- Once the timer fires, a `timer` event will be added to the queue with the ID returned from this function
--- as the first parameter.
---
--- As with `sleep`, the time will automatically be rounded up to the nearest multiple of 0.05 seconds,
--- as it waits for a fixed amount of world ticks.
---
--- # Throws
---
--- - If the time is below zero.
---
--- @param time number The number of seconds until the timer fires.
---
--- @return integer token The ID of the new timer. This can be used to filter the `timer` event, or cancel the timer.
---
--- @see os.cancelTimer()
function os.startTimer(time) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:cancelTimer)
---
--- Cancels a timer previously started with `startTimer`. This will stop the timer from firing.
---
--- # Changes
---
--- - New in version 1.6
---
--- @param token integer The ID of the timer to cancel.
---
--- @see os.startTimer()
function os.cancelTimer(token) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:setAlarm)
---
--- Sets an alarm that will fire at the specified in-game time.
--- When it fires, an `alarm` event will be added to the event queue with the ID returned from this function
--- as the first parameter.
---
--- # Throws
---
--- - If the time is out of range.
---
--- # Changes
---
--- - New in version 1.2
---
--- @param time number The time at which to fire the alarm, in the range `[0.0, 24.0)`.
---
--- @return integer token The ID of the new alarm. This can be used to filter the `alarm` event, or cancel the alarm.
---
--- @see os.cancelAlarm()
function os.setAlarm(time) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:cancelTimer)
---
--- Cancels an alarm previously started with `setAlarm`. This will stop the alarm from firing.
---
--- # Changes
---
--- - New in version 1.6
---
--- @param token integer The ID of the alarm to cancel.
---
--- @see os.setAlarm()
function os.cancelAlarm(token) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:shutdown)
---
--- Shuts down the computer immediately.
function os.shutdown() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:reboot)
---
--- Reboots the computer immediately.
function os.reboot() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:getComputerID)
---
--- Returns the ID of the computer.
---
--- @return integer id The ID of the computer.
function os.getComputerID() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:computerID)
---
--- Returns the ID of the computer.
---
--- @return integer id The ID of the computer.
function os.computerID() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:getComputerLabel)
---
--- Returns the label of the computer.
---
--- # Changes
---
--- - New in version 1.3
---
--- @return string? label The label of the computer.
function os.getComputerLabel() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:computerLabel)
---
--- Returns the label of the computer.
---
--- # Changes
---
--- - New in version 1.3
---
--- @return string? label The label of the computer.
function os.computerLabel() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:setComputerLabel)
---
--- Set the label of this computer.
---
--- # Changes
---
--- - New in version 1.3
---
--- @param label? string The new label. May be `nil` in order to clear it.
function os.setComputerLabel(label) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:clock)
---
--- Returns the number of seconds that the computer has been running.
---
--- # Changes
---
--- - New in version 1.2
---
--- @return number uptime The computer's uptime.
function os.clock() end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:time)
---
--- Returns the current time depending on the string passed in. This will always be in the range [0.0, 24.0).
---
--- - If called with `ingame`, the current world time will be returned. This is the default if nothing is passed.
--- - If called with `utc`, returns the hour of the day in UTC time.
--- - If called with `local`, returns the hour of the day in the timezone the server is located in.
---
--- This function can also be called with a table returned from `date`,
--- which will convert the date fields into a UNIX timestamp (number of seconds since 1 January 1970).
---
--- # Throws
---
--- - If an invalid locale is passed.
---
--- # Usage
---
--- - Print the current in-game time.
---
--- ```lua
--- textutils.formatTime(os.time())
--- ```
---
--- # Changes
---
--- - New in version 1.2
--- - Changed in version 1.80pr1: Add support for getting the local and UTC time.
--- - Changed in version 1.82.0: Arguments are now case insensitive.
--- - Changed in version 1.83.0: `time` now accepts table arguments and converts them to UNIX timestamps.
---
--- @overload fun(locale?: cc.os.Locale): number
--- @overload fun(locale: cc.os.Date): integer
---
--- @param locale? cc.os.Locale | cc.os.Date The locale of the time, or a table filled by `os.date('*t')` to decode.
---
--- Defaults to `ingame` locale if not specified.
---
--- @return number | integer The hour of the selected locale, or a UNIX timestamp from the table.
---
--- @see textutils.formatTime()
--- @see os.date()
function os.time(locale) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:day)
---
--- Returns the day depending on the locale specified.
---
--- - If called with `ingame`, returns the number of days since the world was created. This is the default.
--- - If called with `utc`, returns the number of days since 1 January 1970 in the UTC timezone.
--- - If called with `local`, returns the number of days since 1 January 1970 in the server's local timezone.
---
--- # Throws
---
--- - If an invalid locale is passed.
---
--- # Changes
---
--- - New in version 1.48
--- - Changed in version 1.82.0: Arguments are now case insensitive.
---
--- @param locale? cc.os.Locale The locale to get the day for. Defaults to `ingame` if not set.
---
--- @return integer day The day depending on the selected locale.
function os.day(locale) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:epoch)
---
--- Returns the number of milliseconds since an epoch depending on the locale.
---
--- - If called with `ingame`, returns the number of in-game milliseconds since the world was created.
---   This is the default.
--- - If called with `utc`, returns the number of milliseconds since 1 January 1970 in the UTC timezone.
--- - If called with local, returns the number of milliseconds since 1 January 1970 in the server's local timezone.
---
--- > [!INFO]
--- > The `ingame` time zone assumes that one Minecraft day consists of 86,400,000 milliseconds.
--- > Since one in-game day is much faster than a real day (20 minutes), this will change quicker
--- > than real time - one real second is equal to 72000 in-game milliseconds.
--- >
--- > If you wish to convert this value to real time, divide by 72000;
--- > to convert to ticks (where a day is 24000 ticks), divide by 3600.
---
--- # Throws
---
--- - If an invalid locale is provided.
---
--- # Usage
---
--- - Get the current time and use `date` to convert it to a table.
---
--- ```lua
--- local time = os.epoch('local') / 1000
--- local time_table = os.date('*t', time)
---
--- print(textutils.serialize(time_table))
--- ```
---
--- # Changes
---
--- - New in version 1.80pr1
---
--- @param locale? cc.os.Locale The locale to get the milliseconds for. Defaults to `ingame` if not set.
---
--- @return integer milliseconds The milliseconds since the epoch depending on the selected locale.
function os.epoch(locale) end

--- [Official Documentation](https://tweaked.cc/module/os.html#v:date)
---
--- Returns a date string (or table) using a specified format string and optional time to format.
---
--- The format string takes the same formats as C's `strftime` function.
--- The format string can also be prefixed with an exclamation mark (`!`) to use UTC time instead of
--- the server's local timezone.
---
--- If the format is exactly `'*t'` (or `'!*t'`), a table representation of the timestamp will be returned instead.
--- This table has fields for the year, month, day, hour, minute, second, day of the week, day of the year,
--- and whether Daylight Savings Time is in effect.
--- This table can be converted back to a timestamp with `time`.
---
--- # Throws
---
--- - If an invalid format is passed.
---
--- # Usage
---
--- - Print the current date in a user-friendly string.
---
--- ```lua
--- os.date('%A %d %B %Y')
--- ```
---
--- - Convert a timestamp to a table.
---
--- ```lua
--- os.date('!*t', 1242534247)
--- --[[ {
---     -- Date
---     year = 2009,
---     month = 5,
---     day = 17,
---     yday = 137,
---     wday = 1,
---     -- Time
---     hour = 4,
---     min = 24,
---     sec = 7,
---     isdst = false,
--- }
--- ]]
--- ```
---
--- # Changes
---
--- - New in version 1.83.0
---
--- @param format? '*t' | '!*t' | string The format of the string to return.
---
--- This defaults to `%C`, which expands to a string similar to `'Sat Dec 24 16:58:00 2011'`.
--- @param time? integer The timestamp to convert to a string. This defaults to the current time.
---
--- @return string | cc.os.Date result The resulting formatted string or table.
function os.date(format, time) end
