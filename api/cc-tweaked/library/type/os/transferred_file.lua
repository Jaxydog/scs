--- @meta

--- [Official Documentation](https://tweaked.cc/event/file_transfer.html#ty:TransferredFile)
---
--- A binary file handle that has been transferred to this computer.
---
--- This inherits all methods of binary file handles, meaning you can use the standard `read` functions to access
--- the contents of the file.
---
--- @class cc.os.Event.FileTransfer.TransferredFile: cc.fs.ReadHandle
---
--- @see cc.fs.ReadHandle
local TransferredFile = {}

--- [Official Documentation](https://tweaked.cc/event/file_transfer.html#ty:TransferredFile:getName)
---
--- Get the name of this file being transferred.
---
--- @return string name The file's name.
function TransferredFile.getName() end
