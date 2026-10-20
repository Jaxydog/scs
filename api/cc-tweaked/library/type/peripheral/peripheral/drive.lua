--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html)
---
--- Disk drives are a peripheral which allow you to read and write to floppy disks and other "mountable media"
--- (such as computers or turtles). They also allow you to play records.
---
--- When a disk drive attaches some mount (such as a floppy disk or computer), it attaches a folder called `disk`,
--- `disk2`, etc. to the root directory of the computer.
--- This folder can be used to interact with the files on that disk.
---
--- When a disk is inserted, a `disk` event is fired, with the side peripheral is on.
--- Likewise, when the disk is detached, a `disk_eject` event is fired.
---
--- @class cc.peripheral.Peripheral.Drive
local Drive = {}

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:isDiskPresent)
---
--- Returns whether a disk is currently inserted in the drive.
---
--- @return boolean present Whether a disk is currently inserted in the drive.
function Drive.isDiskPresent() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:getDiskLabel)
---
--- Returns the label of the disk in the drive if available.
---
--- @return string? label The label of the disk, or `nil` if either no disk is inserted or the
--- disk doesn't have a label.
function Drive.getDiskLabel() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:setDiskLabel)
---
--- Sets or clears the label for a disk.
---
--- If no label or `nil` is passed, the label will be cleared.
---
--- If the inserted disk's label can't be changed (for example, a record), an error will be thrown.
---
--- # Throws
---
--- - If the disk's label can't be changed.
---
--- @param label? string The new label of the disk, or `nil` to clear.
function Drive.setDiskLabel(label) end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:hasData)
---
--- Returns whether a disk with data is inserted.
---
--- @return boolean contains Whether a disk with data is inserted.
function Drive.hasData() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:getMountPath)
---
--- Returns the mount path for the inserted disk.
---
--- @return string? path The mount path for the disk, or `nil` if no data disk is inserted.
function Drive.getMountPath() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:hasAudio)
---
--- Returns whether a disk with audio is inserted.
---
--- @return boolean contains Whether a disk with audio is inserted.
function Drive.hasAudio() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:getAudioTitle)
---
--- Returns the title of the inserted audio disk.
---
--- @return string | nil | false title The title of the audio, `false` if no disk is inserted, or `nil` if
--- the disk has no audio.
function Drive.getAudioTitle() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:playAudio)
---
--- Plays the audio in the inserted disk, if available.
function Drive.playAudio() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:stopAudio)
---
--- Stops any audio that may be playing.
function Drive.playAudio() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:ejectDisk)
---
--- Ejects any disk that may be in the drive.
function Drive.ejectDisk() end

--- [Official Documentation](https://tweaked.cc/peripheral/drive.html#v:getDiskID)
---
--- Returns the ID of the disk inserted in the drive.
---
--- # Changes
---
--- - New in version 1.4
---
--- @return integer? id The ID of the disk in the drive, or `nil` if no disk with an ID is inserted.
function Drive.getDiskID() end
