--- [Official Documentation](https://tweaked.cc/module/redstone.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/redstone.html)
---
--- Get and set redstone signals adjacent to this computer.
---
--- The redstone library exposes three "types" of redstone control:
---
--- - Binary input/output (`setOutput`/`getInput`):
--- These simply check if a redstone wire has any input or output.
--- A signal strength of 1 and 15 are treated the same.
---
--- - Analogue input/output (`setAnalogOutput`/`getAnalogInput`):
--- These work with the actual signal strength of the redstone wires, from 0 to 15.
---
--- - Bundled cables (`setBundledOutput`/`getBundledInput`):
--- These interact with "bundled" cables, such as those from Project:Red.
--- These allow you to send 16 separate on/off signals.
--- Each channel corresponds to a color, with the first being `colors.white` and the last `colors.black`.
---
--- Whenever a redstone input changes, a redstone event will be fired. This may be used instead of repeatedly polling.
---
--- This module may also be referred to as `rs`. For example, one may call `rs.getSides()` instead of `getSides`.
---
--- # Usage
---
--- - Toggle the redstone signal above the computer every 0.5 seconds.
---
--- ```lua
--- while true do
---     redstone.setOutput('top', not redstone.getOutput('top'))
---
---     sleep(0.5)
--- end
--- ```
---
--- - Mimic a redstone comparator in subtraction mode.
---
--- ```lua
--- while true do
---     local back = redstone.getAnalogInput('back')
---     local side = math.max(
---         redstone.getAnalogInput('left'),
---         redstone.getAnalogInput('right')
---     )
---
---     redstone.setAnalogOutput('front', math.max(back - side, 0))
---
---     os.pullEvent('redstone')
--- end
--- ```
redstone = {}

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getSides)
---
--- Returns a table containing the six sides of the computer.
--- Namely, "top", "bottom", "left", "right", "front" and "back".
---
--- # Changes
---
--- - New in version 1.2
---
--- @return string[] sides A table of valid sides.
function redstone.getSides() end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getInput)
---
--- Get the current redstone input of a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return boolean on Whether the redstone input is on or off.
function redstone.getInput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getOutput)
---
--- Get the current redstone output of a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return boolean on Whether the redstone output is on or off.
---
--- @see redstone.setOutput()
function redstone.getOutput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:setOutput)
---
--- Turn the redstone signal of a specific side on or off.
---
--- @param side cc.peripheral.Side The side to set.
--- @param on boolean Whether the redstone signal should be on or off. When on, a signal strength of 15 is emitted.
function redstone.setOutput(side, on) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getAnalogInput)
---
--- Get the redstone input signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The input signal strength, between 0 and 15.
function redstone.getAnalogInput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getAnalogueInput)
---
--- Get the redstone input signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The input signal strength, between 0 and 15.
function redstone.getAnalogueInput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getAnalogOutput)
---
--- Get the redstone output signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The output signal strength, between 0 and 15.
---
--- @see redstone.setAnalogOutput()
function redstone.getAnalogOutput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getAnalogueOutput)
---
--- Get the redstone output signal strength for a specific side.
---
--- # Changes
---
--- - New in version 1.51.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer strength The output signal strength, between 0 and 15.
---
--- @see redstone.setAnalogueOutput()
function redstone.getAnalogueOutput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:setAnalogOutput)
---
--- Set the redstone signal strength for a specific side.
---
--- # Throws
---
--- - If `value` is not between 0 and 15.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to set.
--- @param value integer The signal strength between 0 and 15.
function redstone.setAnalogOutput(side, value) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:setAnalogueOutput)
---
--- Set the redstone signal strength for a specific side.
---
--- # Throws
---
--- - If `value` is not between 0 and 15.
---
--- # Changes
---
--- - New in version 1.51
---
--- @param side cc.peripheral.Side The side to set.
--- @param value integer The signal strength between 0 and 15.
function redstone.setAnalogueOutput(side, value) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getBundledInput)
---
--- Get the bundled cable input for a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer input The bundle cable's input.
---
--- @see redstone.testBundledInput()
function redstone.getBundledInput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:getBundledOutput)
---
--- Get the bundled cable output for a specific side.
---
--- @param side cc.peripheral.Side The side to get.
---
--- @return integer output The bundle cable's output.
function redstone.getBundledOutput(side) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:setBundledOutput)
---
--- Set the bundled cable output for a specific side.
---
--- @param side cc.peripheral.Side The side to set.
--- @param output integer The color bitmask to set.
---
--- @see colors.combine()
--- @see colors.subtract()
function redstone.setBundledOutput(side, output) end

--- [Official Documentation](https://tweaked.cc/module/redstone.html#v:testBundledInput)
---
--- Determine if a specific combination of colours are on for the given side.
---
--- # Usage
---
--- - Check if `colors.white` and `colors.black` are on above this block.
---
--- ```lua
--- print(redstone.testBundledInput('top', colors.combine(colors.white, colors.black)))
--- ```
---
--- @param side cc.peripheral.Side The side to test.
--- @param mask integer The mask to test.
---
--- @return boolean on If the colors are on.
---
--- @see redstone.getBundledInput()
function redstone.testBundledInput(side, mask) end

rs = redstone
