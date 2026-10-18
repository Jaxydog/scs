--- @meta

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:WriteHandle)
---
--- A file handle opened for writing with `fs.open`.
---
--- @class cc.fs.WriteHandle
local WriteHandle = {}

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:WriteHandle:write)
---
--- Write a string or byte to the file.
---
--- # Throws
---
--- - If the file has been closed.
---
--- # Changes
---
--- - Changed in version 1.80pr1: Now accepts a string to write multiple bytes.
---
--- @param contents string | integer The string or byte to write.
function WriteHandle.write(contents) end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:WriteHandle:writeLine)
---
--- Write a string of characters to the file, following them with a newline character.
---
--- # Throws
---
--- - If the file has been closed.
---
--- @param text string The text to write to the file.
function WriteHandle.writeLine(text) end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:WriteHandle:flush)
---
--- Save the current file without closing it.
---
--- # Throws
---
--- - If the file has been closed.
function WriteHandle.flush() end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:WriteHandle:seek)
---
--- Seek to a new position within the file, changing where bytes are written to.
--- The new position is an offset given by `offset`, relative to a start position determined by `whence`.
---
--- In case of success, `seek` returns the new file position from the beginning of the file.
---
--- # Throws
---
--- - If the file has been closed.
---
--- # Changes
---
--- - New in version 1.80pr1.9
--- - Changed in version 1.109.0: Now available on all file handles, not just binary-mode handles.
---
--- @param whence? cc.io.SeekPosition Where the offset is relative to.
--- @param offset? integer The offset to seek to.
---
--- @return integer? position The new position, or `nil` if seeking failed.
--- @return string? reason The reason seeking failed.
---
--- @return_overload integer
--- @return_overload nil, string
function WriteHandle.seek(whence, offset) end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:WriteHandle:close)
---
--- Close this file, freeing any resources it uses.
---
--- Once a file is closed it may no longer be read or written to.
---
--- # Throws
---
--- - If the file has already been closed.
function WriteHandle.close() end
