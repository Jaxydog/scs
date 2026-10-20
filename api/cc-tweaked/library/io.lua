--- [Official Documentation](https://tweaked.cc/module/io.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/io.html)
---
--- Emulates Lua's standard `io` library.
io = {}

--- [Official Documentation](https://tweaked.cc/module/io.html#v:stdin)
---
--- A file handle representing the 'standard input'.
--- Reading from this file will prompt the user for input.
---
--- @type cc.io.Handle
io.stdin = nil

--- [Official Documentation](https://tweaked.cc/module/io.html#v:stdout)
---
--- A file handle representing the 'standard output'.
--- Writing to this file will display the written text to the screen.
---
--- @type cc.io.Handle
io.stdout = nil

--- [Official Documentation](https://tweaked.cc/module/io.html#v:stderr)
---
--- A file handle representing the 'standard error' stream.
---
--- One may use this to display error messages, writing to it will display them on the terminal.
---
--- @type cc.io.Handle
io.stderr = nil

--- [Official Documentation](https://tweaked.cc/module/io.html#v:close)
---
--- Closes the provided file handle.
---
--- # Changes
---
--- - New in version 1.55
---
--- @param file? cc.io.Handle The file handle to close, defaults to the current output file.
---
--- @see Handle.close()
--- @see io.output()
function io.close(file) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:flush)
---
--- Flushes the current output file.
---
--- # Changes
---
--- - New in version 1.55
---
--- @see Handle.flush()
--- @see io.output()
function io.flush() end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:input)
---
--- Get or set the current input file.
---
--- # Throws
---
--- - If the provided filename cannot be opened for reading.
---
--- # Changes
---
--- - New in version 1.55
---
--- @param file? cc.io.Handle | string The new input file, either as a file path or pre-existing handle.
---
--- @return cc.io.Handle handle The current input file.
function io.input(file) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:lines)
---
--- Opens the given filename in read mode and returns an iterator that, each time it is called,
--- returns the next line from the file.
---
--- This can be used in a for loop to iterate all lines of a file
---
--- Once the end of the file has been reached, `nil` will be returned. The file is automatically closed.
---
--- If no filename is given, the current input will be used instead. In this case, the handle is not used.
---
--- # Throws
---
--- - If the file cannot be opened for reading.
---
--- # Usage
---
--- - Iterate over every line in a file and print it out.
---
--- ```lua
--- for line in io.lines('/rom/help/intro.txt') do
---     print(line)
--- end
--- ```
---
--- # Changes
---
--- - New in version 1.55
---
--- @param filename? string The name of the file to extract lines from.
--- @param ... cc.io.ReadFormat The argument to pass to `read` for each line.
---
--- @return fun(): string? iterator The line iterator.
---
--- @see Handle.lines()
--- @see io.input()
function io.lines(filename, ...) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:read)
---
--- Open a file with the given mode, either returning a new file handle or `nil` plus an error message.
---
--- # Changes
---
--- - Changed in version 1.111.0: Add support for `r+` and `w+`.
---
--- @param filename string The name of the file to open.
--- @param mode? cc.fs.OpenMode The mode to open the file with. This defaults to `r`.
---
--- @return cc.io.Handle? The opened file.
--- @return string? The reason the file could not be opened.
---
--- @return_overload cc.io.Handle
--- @return_overload nil, string
function io.read(filename, mode) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:output)
---
--- Get or set the current output file.
---
--- # Throws
---
--- - If the provided filename cannot be opened for writing.
---
--- # Changes
---
--- - New in version 1.55
---
--- @param file? cc.io.Handle | string The new output file, either as a file path or pre-existing handle.
---
--- @return cc.io.Handle handle The current output file.
function io.output(file) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:read)
---
--- Read from the currently opened input file.
---
--- This is equivalent to `io.input():read(...)`. See the documentation there for full details.
---
--- @param ... cc.io.ReadFormat The formats to read, defaulting to a whole line.
---
--- @return string? ... data The data read from the file.
function io.read(...) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:type)
---
--- Checks whether `obj` is a given file handle, and determine if it is open or not.
---
--- This returns one of:
--- - `'file`' if this is an open file
--- - `'closed file'` if it is a closed file handle
--- - `nil` if this is not a file handle.
---
--- @param obj any The value to check.
---
--- @return 'file' | 'closed file' | nil result The result.
function io.type(obj) end

--- [Official Documentation](https://tweaked.cc/module/io.html#v:write)
---
--- Write to the currently opened output file.
---
--- This is equivalent to `io.output():write(...)`. See the documentation there for full details.
---
--- # Changes
---
--- - Changed in version 1.81.0: Multiple arguments are now allowed.
---
--- @param ... string The strings to write.
function io.write(...) end
