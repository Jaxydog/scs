--- @meta

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window)
---
--- The window object. Refer to the module's documentation for a full description.
---
--- @class cc.window.Window: cc.term.Redirect
local Window = {}

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:getLine)
---
--- Get the buffered contents of a line in this window.
---
--- # Throws
---
--- - If `y` is not between 1 and this window's height.
---
--- # Changes
---
--- - New in version 1.84.0
---
--- @param y integer The y position of the line to get.
---
--- @return string content The textual content of this line.
--- @return string textColors The text colours of this line, suitable for use with `term.blit`.
--- @return string backgroundColors The background colours of this line, suitable for use with `term.blit`.
function Window.getLine(y) end

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:setVisible)
---
--- Set whether this window is visible.
--- Invisible windows will not be drawn to the screen until they are made visible again.
---
--- Making an invisible window visible will immediately draw it.
---
--- @param visible boolean Whether this window is visible.
function Window.setVisible(visible) end

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:isVisible)
---
--- Get whether this window is visible.
--- Invisible windows will not be drawn to the screen until they are made visible again.
---
--- # Changes
---
--- - New in version 1.94.0
---
--- @return boolean visible Whether this window is visible.
---
--- @see setVisible()
function Window.isVisible() end

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:redraw)
---
--- Draw this window.
--- This does nothing if the window is not visible.
---
--- @see setVisible()
function Window.redraw() end

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:restoreCursor)
---
--- Set the current terminal's cursor to where this window's cursor is.
--- This does nothing if the window is not visible.
function Window.restoreCursor() end

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:getPosition)
---
--- Get the position of the top left corner of this window.
---
--- @return integer x The x position of this window.
--- @return integer y The y position of this window.
function Window.getPosition() end

--- [Official Documentation](https://tweaked.cc/module/window.html#ty:Window:reposition)
---
--- Reposition or resize the given window.
---
--- This function also accepts arguments to change the size of this window.
--- It is recommended that you fire a `term_resize` event after changing a window's, to allow programs to
--- adjust their sizing.
---
--- # Changes
---
--- - Changed in version 1.85.0: Add `new_parent` parameter.
---
--- @param newX integer The new x position of this window.
--- @param newY integer The new y position of this window.
--- @param newWidth? integer The new width of this window.
--- @param newHeight? integer The new height of this window.
--- @param newParent? cc.term.Redirect The new redirect object this window should draw to.
function Window.reposition(newX, newY, newWidth, newHeight, newParent) end
