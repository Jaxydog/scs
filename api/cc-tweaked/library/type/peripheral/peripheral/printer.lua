--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html)
---
--- The printer peripheral allows printing text onto pages.
--- These pages can then be crafted together into printed pages or books.
---
--- Printers require ink (one of the colored dyes) and paper in order to function.
--- Once loaded, a new page can be started with `newPage`.
--- Then the printer can be used similarly to a normal terminal; text can be written, and the cursor moved.
--- Once all text has been printed, `endPage` should be called to finally print the page.
---
--- # Usage
---
--- - Print a page titled 'Hello' with a small message on it.
---
--- ```lua
--- local printer = peripheral.find('printer')
---
--- if not printer.newPage() then
---     error('Cannot start a new page. Do you have ink and paper?')
--- end
---
--- printer.setPageTitle('Hello')
--- printer.write('This is my first page.')
--- printer.setCursorPos(1, 3)
--- printer.write('This is two lines below.')
---
--- if not printer.endPage() then
---     error('Cannot end the page. Is there enough space?')
--- end
--- ```
---
--- @class cc.peripheral.Peripheral.Printer
local Printer = {}

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:write)
---
--- Writes text to the current page.
---
--- # Throws
---
--- - If any values couldn't be converted to a string, or if no page is started.
---
--- @param text string The value to write to the page.
function Printer.write(text) end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:getCursorPos)
---
--- Returns the current position of the cursor on the page.
---
--- # Throws
---
--- - If a page isn't being printed.
---
--- @return integer x The X position of the cursor.
--- @return integer y The Y position of the cursor.
function Printer.getCursorPos() end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:setCursorPos)
---
--- Sets the position of the cursor on the page.
---
--- # Throws
---
--- - If a page isn't being printed.
---
--- @param x integer The X coordinate to set the cursor to.
--- @param y integer The Y coordinate to set the cursor to.
function Printer.setCursorPos(x, y) end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:getPageSize)
---
--- Returns the size of the current page.
---
--- # Throws
---
--- - If a page isn't being printed.
---
--- @return integer width The width of the page.
--- @return integer height The height of the page.
function Printer.getPageSize() end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:newPage)
---
--- Starts printing a new page.
---
--- @return boolean started Whether a new page could be started.
function Printer.newPage() end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:endPage)
---
--- Finalizes printing of the current page and outputs it to the tray.
---
--- # Throws
---
--- - If a page isn't being printed.
---
--- @return boolean finished Whether the page could be successfully finished.
function Printer.endPage() end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:setPageTitle)
---
--- Sets the title of the current page.
---
--- # Throws
---
--- - If a page isn't being printed.
---
--- @param title? string The title to set for the page.
function Printer.setPageTitle(title) end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:getInkLevel)
---
--- Returns the amount of ink left in the printer.
---
--- @return integer ink The amount of ink available to print with.
function Printer.getInkLevel() end

--- [Official Documentation](https://tweaked.cc/peripheral/printer.html#v:getPaperLevel)
---
--- Returns the amount of paper left in the printer.
---
--- @return integer paper The amount of paper available to print with.
function Printer.getPaperLevel() end
