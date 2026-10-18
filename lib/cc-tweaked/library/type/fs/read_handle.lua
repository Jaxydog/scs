--- @meta

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:ReadHandle)
---
--- A file handle opened for reading with `fs.open`.
---
--- @class cc.fs.ReadHandle
local ReadHandle = {}

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:ReadHandle:read)
---
--- Read a number of bytes from this file.
---
--- # Throws
---
--- - When trying to read a negative number of bytes.
--- - If the file has been closed.
---
--- # Changes
---
--- - Changed in version 1.80pr1: Now accepts an integer argument to read multiple bytes,
---   returning a string instead of a number.
---
--- @param count? integer The number of bytes to read.
--- This may be 0 to determine we are at the end of the file. When absent, a single byte will be read.
---
--- @return nil | integer | string result This can be one of:
--- - `nil` if we are at the end of the file.
--- - The value of the byte read if the file is opened in binary mode and `count` is absent.
--- - The bytes read as a string, if `count` is given.
function ReadHandle.read(count) end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:ReadHandle:readAll)
---
--- Read the remainder of the file.
---
--- # Throws
---
--- - If the file has been closed.
---
--- # Changes
---
--- - New in version 1.80pr1.
--- - Changed in version 1.109.0: Binary-mode handles are now consistent with non-binary files,
---   and return an empty string at the end of the file, rather than `nil`.
---
--- @return string? contents The remaining contents of the file, or `nil` in the event of an error.
function ReadHandle.readAll() end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:ReadHandle:readLine)
---
--- Read a line from the file.
---
--- # Throws
---
--- - If the file has been closed.
---
--- # Changes
---
--- - New in version 1.80pr1.9
--- - Changed in version 1.81.0: `\r` is now stripped.
---
--- @param withTrailing? boolean Whether to include the newline characters with the returned string. Defaults to false.
---
--- @return string? The read line or `nil` if at the end of the file.
function ReadHandle.readLine(withTrailing) end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:ReadHandle:seek)
---
--- Seek to a new position within the file, changing where bytes are read from.
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
function ReadHandle.seek(whence, offset) end

--- [Official Documentation](https://tweaked.cc/module/fs.html#ty:ReadHandle:close)
---
--- Close this file, freeing any resources it uses.
---
--- Once a file is closed it may no longer be read or written to.
---
--- # Throws
---
--- - If the file has already been closed.
function ReadHandle.close() end
