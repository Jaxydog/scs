--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/monitor.html)
---
--- Monitors are a block which act as a terminal, displaying information on one side. This allows them to be read and
--- interacted with in-world without opening a GUI.
---
--- Monitors act as terminal redirects and so expose the same methods, as well as several additional ones,
--- which are documented below.
---
--- If the monitor is resized (by adding new blocks to the monitor, or by calling `setTextScale`),
--- then a `monitor_resize` event will be queued.
---
--- Like computers, monitors come in both normal (no color) and advanced (color) varieties.
--- Advanced monitors be right-clicked, which will trigger a `monitor_touch` event.
---
--- # Usage
---
--- - Write 'Hello, world!' to an adjacent monitor.
---
--- ```lua
--- local monitor = peripheral.find('monitor')
---
--- monitor.setCursorPos(1, 1)
--- monitor.write('Hello, world!')
--- ```
---
--- @see cc.os.Event.MonitorResize
--- @see cc.os.Event.MonitorTouch
---
--- @class cc.peripheral.Peripheral.Monitor: cc.term.Redirect
local Monitor = {}

--- [Official Documentation](https://tweaked.cc/peripheral/monitor.html#v:getTextScale)
---
--- Get the monitor's current text scale.
---
--- # Throws
---
--- - If the monitor cannot be found.
---
--- # Changes
---
--- - New in version 1.81.0
---
--- @return number scale The monitor's current scale.
function Monitor.getTextScale() end

--- [Official Documentation](https://tweaked.cc/peripheral/monitor.html#v:setTextScale)
---
--- Set the scale of this monitor.
--- A larger scale will result in the monitor having a lower resolution, but display text much larger.
---
--- # Throws
---
--- - If the scale is out of range.
---
--- @param scale number The monitor's scale. This must be a multiple of 0.5 between 0.5 and 5.
function Monitor.setTextScale(scale) end
