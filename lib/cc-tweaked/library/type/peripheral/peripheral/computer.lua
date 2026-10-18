--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html)
---
--- A computer or turtle wrapped as a peripheral.
---
--- This allows for basic interaction with adjacent computers.
--- Computers wrapped as peripherals will have the type `computer` while turtles will be `turtle`.
---
--- @class cc.peripheral.Peripheral.Computer
local Computer = {}

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html#v:turnOn)
---
--- Turn the other computer on.
function Computer.turnOn() end

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html#v:shutdown)
---
--- Shut down the other computer.
function Computer.shutdown() end

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html#v:reboot)
---
--- Reboot or turn on the other computer.
function Computer.reboot() end

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html#v:isOn)
---
--- Determine if the other computer is on.
---
--- @return boolean on If the computer is on.
function Computer.isOn() end

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html#v:getID)
---
--- Get the other computer's ID.
---
--- @return integer id The computer's ID.
---
--- @see os.getComputerID()
function Computer.getID() end

--- [Official Documentation](https://tweaked.cc/peripheral/computer.html#v:getLabel)
---
--- Get the other computer's label.
---
--- @return string? label The computer's label.
---
--- @see os.getComputerLabel()
function Computer.getLabel() end
