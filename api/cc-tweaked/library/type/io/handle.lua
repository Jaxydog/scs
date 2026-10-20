--- @meta

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle)
---
--- @class cc.io.Handle
local Handle = {}

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:close)
---
--- Close this file handle, freeing any resources it uses.
---
--- # Throws
---
--- - If this handle was already closed.
---
--- @return boolean success Whether the handle was closed.
--- @return string? reason The reason it could not be closed.
---
--- @return_overload true
--- @return_overload false, string
function Handle:close() end

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:flush)
---
--- Flush any buffered output, forcing it to be written to the file
---
--- # Throws
---
--- - If this handle has been closed.
function Handle:flush() end

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:lines)
---
--- Returns an iterator that, each time it is called, returns the next line from the file.
---
--- This can be used in a for loop to iterate all lines of a file
---
--- Once the end of the file has been reached, `nil` will be returned. The file is not automatically closed.
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
--- local file = io.open('/rom/help/intro.txt')
---
--- for line in file:lines() do
---     print(line)
--- end
---
--- file:close()
--- ```
---
--- # Changes
---
--- - New in version 1.3
---
--- @param ... cc.io.ReadFormat The argument to pass to `read` for each line.
---
--- @return fun(): string? iterator The line iterator.
---
--- @see io.lines()
function Handle:lines(...) end

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:read)
---
--- Reads data from the file, using the specified formats.
--- For each format provided, the function returns either the data read, or `nil` if no data could be read.
---
--- If no format is provided, `l` is assumed.
---
--- @param ... cc.io.ReadFormat The formats to use.
---
--- @return string? ... data The data read from the file.
function Handle:read(...) end

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:seek)
---
--- Seeks the file cursor to the specified position, and returns the new position.
---
--- The default value of `whence` is `cur`, and the default value of `offset` is `0`.
--- This means that `file:seek()` without arguments returns the current position without moving.
---
--- @param whence? cc.io.SeekPosition The place to set the cursor from.
--- @param offset? integer The offset from the position determined by `whence` to move to.
---
--- @return integer location The new location of the file cursor.
function Handle:seek(whence, offset) end

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:setvbuf)
---
--- > [!WARN]
--- > This has no effect in CC.
---
--- Sets the buffering mode for an output file.
---
--- This has no effect under ComputerCraft, and exists with compatibility with base Lua.
---
--- @deprecated
---
--- @param mode string | 'no' | 'full' | 'line' The buffering mode.
--- @param size? integer The size of the buffer.
---
--- @see file.setvbuf()
function Handle:setvbuf(mode, size) end

--- [Official Documentation](https://tweaked.cc/module/io.html#ty:Handle:write)
---
--- Write one or more values to the file.
---
--- # Changes
---
--- - Changed in version 1.81.0: Multiple arguments are now allowed.
---
--- @param ... string | integer The values to write.
---
--- @return cc.io.Handle? handle The current file, allowing chaining calls.
--- @return string? reason The error message which occurred while writing.
---
--- @return_overload cc.io.Handle
--- @return_overload nil, string
function Handle:write(...) end
