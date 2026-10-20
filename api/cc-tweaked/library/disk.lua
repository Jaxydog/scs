--- [Official Documentation](https://tweaked.cc/module/disk.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/disk.html)
---
--- Interact with disk drives.
---
--- These functions can operate on locally attached or remote disk drives.
--- To use a locally attached drive, specify “side” as one of the six sides (e.g. `left`);
--- to use a remote disk drive, specify its name as printed when enabling its modem (e.g. `drive_0`).
---
--- > [!TIP]
--- > All computers (except command computers), turtles and pocket computers can be placed within
--- > a disk drive to access its internal storage like a disk.
---
--- # Changes
---
--- - New in version 1.2
disk = {}

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:isPresent)
---
--- Checks whether any item at all is in the disk drive.
---
--- # Usage
---
--- - Check for an item in the above disk drive.
---
--- ```lua
--- disk.isPresent('top')
--- -- => true / false
--- ```
---
--- @param name string The name of the disk drive.
---
--- @return boolean present If something is in the disk drive.
function disk.isPresent(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:getLabel)
---
--- Get the label of the floppy disk, record, or other media within the given disk drive.
---
--- If there is a computer or turtle within the drive, this will get the label as read by `os.getComputerLabel`.
---
--- @param name string The name of the disk drive.
---
--- @return string? label The name of the current media, or `nil` if the drive is not present or empty.
---
--- @see disk.setLabel()
function disk.getLabel(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:setLabel)
---
--- Set the label of the floppy disk or other media.
---
--- @param name string The name of the disk drive.
--- @param label? string The new lable of the disk.
function disk.setLabel(name, label) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:hasData)
---
--- Check whether the current disk provides a mount.
---
--- This will return true for disks and computers, but not records.
---
--- @param name string The name of the disk drive.
---
--- @return boolean contained If the disk is present and provides a mount.
---
--- @see disk.getMountPath()
function disk.hasData(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:getMountPath)
---
--- Find the directory name on the local computer where the contents of the current
--- floppy disk (or other mount) can be found.
---
--- @param name string The name of the disk drive.
---
--- @return string? path The mount's directory, or `nil` if the drive does not contain a floppy or computer.
---
--- @see disk.hasData()
function disk.getMountPath(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:hasAudio)
---
--- Whether the current disk is a music disk as opposed to a floppy disk or other item.
---
--- If this returns true, you can play the record.
---
--- @param name string The name of the disk drive.
---
--- @return boolean contained If the disk is present and has audio saved on it.
function disk.hasAudio(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:getAudioTitle)
---
--- Get the title of the audio track from the music record in the drive.
---
--- This generally returns the same as `disk.getLabel` for records.
---
--- @param name string The name of the disk drive.
---
--- @return string | false | nil result The track title, `false` if there is not a music record in the drive,
--- or `nil` if no drive is present.
function disk.getAudioTitle(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:playAudio)
---
--- Starts playing the music record in the drive.
---
--- If any record is already playing on any disk drive, it stops before the target drive starts playing.
--- The record stops when it reaches the end of the track, when it is removed from the drive,
--- when `disk.stopAudio` is called, or when another record is started.
---
--- # Usage
---
--- - Play audio from a disk drive on the bottom of the computer.
---
--- ```lua
--- disk.playAudio('bottom')
--- ```
---
--- @param name string The name of the disk drive.
function disk.playAudio(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:stopAudio)
---
--- Stops the music record in the drive from playing, if it was started with `disk.playAudio`.
---
--- @param name string The name of the disk drive.
function disk.stopAudio(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:eject)
---
--- Ejects any item currently in the drive, spilling it into the world as a loose item.
---
--- # Usage
---
--- - Eject a disk from a disk drive on the bottom of the computer.
---
--- ```lua
--- disk.eject('bottom')
--- ```
---
--- @param name string The name of the disk drive.
function disk.eject(name) end

--- [Official Documentation](https://tweaked.cc/module/disk.html#v:getID)
---
--- Returns a number which uniquely identifies the disk in the drive.
---
--- Note, unlike `disk.getLabel`, this does not return anything for other media, such as computers or turtles.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param name string The name of the disk drive.
---
--- @return string? id The disk ID, or `nil` if the drive does not contain a floppy disk.
function disk.getID(name) end
