--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html)
---
--- The redstone relay is a peripheral that allows reading and outputting redstone signals. While this is not very
--- useful on its own (as computers have the same functionality built-in), this can be used with wired modems to
--- interact with multiple redstone signals from the same computer.
---
--- The peripheral provides largely identical methods to a computer's built-in `redstone` API, allowing setting
--- signals on all six sides of the block ("top", "bottom", "left", "right", "front" and "back").
---
--- # Usage
---
--- - Toggle the redstone signal above the computer every 0.5 seconds.
---
--- ```lua
--- local relay = peripheral.find('redstone_relay')
---
--- while true do
---     relay.setOutput('top', not relay.getOutput('top'))
---
---     sleep(0.5)
--- end
--- ```
---
--- # Changes
---
--- - New in version 1.114.0
---
--- @class cc.peripheral.Peripheral.RedstoneRelay
local RedstoneRelay = {}

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getInput)
---
--- Get the current redstone input of a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return boolean on Whether the redstone input is on or off.
function RedstoneRelay.getInput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getOutput)
---
--- Get the current redstone output of a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return boolean on Whether the redstone output is on or off.
---
--- @see setOutput()
function RedstoneRelay.getOutput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setOutput)
---
--- Turn the redstone signal of a specific side on or off.
---
--- @param side cc.peripheral.Side The side to set.
--- @param on boolean Whether the redstone signal should be on or off. When on, a signal strength of 15 is emitted.
function RedstoneRelay.setOutput(side, on) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getAnalogInput)
---
--- Get the redstone input signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The input signal strength, between 0 and 15.
function RedstoneRelay.getAnalogInput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getAnalogueInput)
---
--- Get the redstone input signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The input signal strength, between 0 and 15.
function RedstoneRelay.getAnalogueInput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getAnalogOutput)
---
--- Get the redstone output signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The output signal strength, between 0 and 15.
function RedstoneRelay.getAnalogOutput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getAnalogueOutput)
---
--- Get the redstone output signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The output signal strength, between 0 and 15.
function RedstoneRelay.getAnalogueOutput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setAnalogOutput)
---
--- Set the redstone signal strength for a specific side.
---
--- # Throws
---
--- - If value is not between `0` and `15`.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to set.
--- @param value integer The signal strength between 0 and 15.
function RedstoneRelay.setAnalogOutput(side, value) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setAnalogueOutput)
---
--- Set the redstone signal strength for a specific side.
---
--- # Throws
---
--- - If value is not between `0` and `15`.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to set.
--- @param value integer The signal strength between 0 and 15.
function RedstoneRelay.setAnalogueOutput(side, value) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getBundledInput)
---
--- Get the bundled cable input for a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer input The bundle cable's input.
function RedstoneRelay.getBundledInput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:getBundledOutput)
---
--- Get the bundled cable output for a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer output The bundle cable's output.
function RedstoneRelay.getBundledOutput(side) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:setBundledOutput)
---
--- Set the bundled cable output for a specific side.
---
--- @param side cc.peripheral.Side The side to set.
--- @param value integer The colour bitmask to set.
---
--- @see colors.combine()
--- @see colors.subtract()
function RedstoneRelay.setBundledOutput(side, value) end

--- [Official Documentation](https://tweaked.cc/peripheral/redstone_relay.html#v:testBundledInput)
---
--- Determine if a specific combination of colors are on for the given side.
---
--- # Usage
---
--- - Check is `colors.white` and `colors.block` are on above this block.
---
--- ```lua
--- print(redstone.testBundledInput('top', colors.combine(colors.white, colors.black)))
--- ```
---
--- @param side cc.peripheral.Side The side to test.
--- @param mask integer The mask to test.
---
--- @return boolean on If the colours are on.
function RedstoneRelay.testBundledInput(side, mask) end
