--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/command.html)
---
--- This peripheral allows you to interact with command blocks.
---
--- Command blocks are only wrapped as peripherals if the `enable_command_block` option is true within the config.
---
--- This API is not the same as the `commands` API, which is exposed on command computers.
---
--- @class cc.peripheral.Peripheral.Command
local Command = {}

--- [Official Documentation](https://tweaked.cc/peripheral/command.html#v:getCommand)
---
--- Get the command this command block will run.
---
--- @return string command The current command.
function Command.getCommand() end

--- [Official Documentation](https://tweaked.cc/peripheral/command.html#v:setCommand)
---
--- Set the command block's command.
---
--- @param command string The new command.
function Command.setCommand(command) end

--- [Official Documentation](https://tweaked.cc/peripheral/command.html#v:runCommand)
---
--- Execute the command block once.
---
--- @return boolean success If the command completed successfully.
--- @return string? reason A failure message.
function Command.runCommand() end
