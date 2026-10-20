--- @meta

--- [Official Documentation](https://tweaked.cc/event/file_transfer.html#ty:TransferredFiles)
---
--- A list of files that have been transferred to this computer.
---
--- @class cc.os.Event.FileTransfer.TransferredFiles
local TransferredFiles = {}

--- [Official Documentation](https://tweaked.cc/event/file_transfer.html#ty:TransferredFiles:getFiles)
---
--- All the files that are being transferred to this computer.
---
--- @return cc.os.Event.FileTransfer.TransferredFile[] files The list of files.
function TransferredFiles.getFiles() end
