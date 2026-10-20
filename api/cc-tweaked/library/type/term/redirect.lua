--- @meta

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect)
---
--- A base class for all objects which interact with a terminal. Namely the `term` and monitors.
---
--- @class cc.term.Redirect
local Redirect = {}

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:write)
---
--- Write `text` at the current cursor position, moving the cursor to the end of the text.
---
--- Unlike functions like `_G.write` and `print`, this does not wrap the text - it simply copies the text to the
--- current terminal line.
---
--- @param text string The text to write.
function Redirect.write(text) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:scroll)
---
--- Move all positions up (or down) by `y` pixels.
---
--- Every pixel in the terminal will be replaced by the line `y` pixels below it.
--- If `y` is negative, it will copy pixels from above instead.
---
--- @param y integer The number of lines to move up by. This may be a negative number.
function Redirect.scroll(y) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getCursorPos)
---
--- Get the position of the cursor.
---
--- @return integer x The x position of the cursor.
--- @return integer y The y position of the cursor.
function Redirect.getCursorPos() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setCursorPos)
---
--- Set the position of the cursor. Terminal writes will begin from this position.
---
--- @param x integer The x position of the cursor.
--- @param y integer The y position of the cursor.
function Redirect.setCursorPos(x, y) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getCursorBlink)
---
--- Checks if the cursor is currently blinking.
---
--- # Changes
---
--- - New in version 1.80pr1.9
---
--- @return boolean blinking If the cursor is blinking.
function Redirect.getCursorBlink() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setCursorBlink)
---
--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---
--- @param blink boolean Whether the cursor should blink.
function Redirect.setCursorBlink(blink) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getSize)
---
--- Get the size of the terminal.
---
--- @return integer width The terminal's width.
--- @return integer height The terminal's height.
function Redirect.getSize() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:clear)
---
--- Clears the terminal, filling it with the current background colour.
function Redirect.clear() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:clearLine)
---
--- Clears the line the cursor is currently on, filling it with the current background colour.
function Redirect.clearLine() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getTextColour)
---
--- Return the colour that new text will be written as.
---
--- # Changes
---
--- - New in version 1.74
---
--- @return integer colour The current text colour.
---
--- @see colours
function Redirect.getTextColour() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getTextColor)
---
--- Return the color that new text will be written as.
---
--- # Changes
---
--- - New in version 1.74
---
--- @return integer color The current text color.
---
--- @see colors
function Redirect.getTextColor() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setTextColour)
---
--- Set the colour that new text will be written as.
---
--- # Changes
---
--- - New in version 1.45
--- - Changed in version 1.80pr1: Standard computers can now use all 16 colours, being changed to greyscale on screen.
---
--- @param colour integer The new text colour.
---
--- @see colours
function Redirect.setTextColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setTextColor)
---
--- Set the color that new text will be written as.
---
--- # Changes
---
--- - New in version 1.45
--- - Changed in version 1.80pr1: Standard computers can now use all 16 colors, being changed to grayscale on screen.
---
--- @param color integer The new text color.
---
--- @see colors
function Redirect.setTextColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getBackgroundColour)
---
--- Return the current background colour. This is used when writing text and clearing the terminal.
---
--- # Changes
---
--- - New in version 1.74
---
--- @return integer colour The current background colour.
---
--- @see colours
function Redirect.getBackgroundColour() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getBackgroundColor)
---
--- Return the current background color. This is used when writing text and clearing the terminal.
---
--- # Changes
---
--- - New in version 1.74
---
--- @return integer color The current background color.
---
--- @see colors
function Redirect.getBackgroundColor() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setBackgroundColour)
---
--- Set the current background colour. This is used when writing text and clearing the terminal.
---
--- # Changes
---
--- - New in version 1.74
--- - Changed in version 1.80pr1: Standard computers can now use all 16 colours, being changed to greyscale on screen.
---
--- @param colour integer The new background colour.
---
--- @see colours
function Redirect.setBackgroundColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setBackgroundColor)
---
--- Set the current background color. This is used when writing text and clearing the terminal.
---
--- # Changes
---
--- - New in version 1.74
--- - Changed in version 1.80pr1: Standard computers can now use all 16 colors, being changed to grayscale on screen.
---
--- @param color integer The new background color.
---
--- @see colors
function Redirect.setBackgroundColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:isColour)
---
--- Determine if this terminal supports colour.
---
--- Terminals which do not support colour will still allow writing coloured text/backgrounds,
--- but it will be displayed in greyscale.
---
--- # Changes
---
--- - New in version 1.45
---
--- @return boolean coloured Whether this terminal supports colour.
function Redirect.isColour() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:isColor)
---
--- Determine if this terminal supports color.
---
--- Terminals which do not support color will still allow writing colored text/backgrounds,
--- but it will be displayed in grayscale.
---
--- # Changes
---
--- - New in version 1.45
---
--- @return boolean colored Whether this terminal supports color.
function Redirect.isColor() end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:blit)
---
--- Writes `text` to the terminal with the specific foreground and background colors.
---
--- As with `write`, the text will be written at the current cursor location,
--- with the cursor moving to the end of the text.
---
--- `textColor` and `backgroundColor` must both be strings the same length as `text`.
--- All characters represent a single hexadecimal digit, which is converted to one of CC's colors.
--- For instance, `'a'` corresponds to purple.
---
--- # Throws
---
--- - If the three inputs are not the same length.
---
--- # Usage
---
--- - Prints 'Hello, world!' in rainbow text.
---
--- ```lua
--- term.blit('Hello, world!', '01234456789ab', '0000000000000')
--- ```
---
--- # Changes
---
--- - New in version 1.74
--- - Changed in version 1.80pr1: Standard computers can now use all 16 colors, being changed to grayscale on screen.
---
--- @param test string The text to write.
--- @param textColor string The corresponding text colors.
--- @param backgroundColor string The corresponding background colors.
---
--- @see colors
function Redirect.blit(text, textColor, backgroundColor) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getPaletteColour)
---
--- Get the current palette for a specific colour.
---
--- # Changes
---
--- - New in version 1.80pr1
---
--- @param colour integer The colour whose palette should be fetched.
---
--- @return number r The red channel, will be between 0 and 1.
--- @return number g The green channel, will be between 0 and 1.
--- @return number b The blue channel, will be between 0 and 1.
function Redirect.getPaletteColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:getPaletteColor)
---
--- Get the current palette for a specific color.
---
--- # Changes
---
--- - New in version 1.80pr1
---
--- @param color integer The color whose palette should be fetched.
---
--- @return number r The red channel, will be between 0 and 1.
--- @return number g The green channel, will be between 0 and 1.
--- @return number b The blue channel, will be between 0 and 1.
function Redirect.getPaletteColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setPaletteColour)
---
--- Set the palette for a specific colour.
---
--- ComputerCraft's palette system allows you to change how a specific colour should be displayed.
--- For instance, you can make `colours.red` more red by setting its palette to `#FF0000`.
---
--- This does now allow you to draw more colours - you are still limited to 16 on the screen at one time -
--- but you can change which colours are used.
---
--- # Usage
---
--- - Change the red colour from the default `#CC4C4C` to `#FF0000`.
---
--- ```lua
--- term.setPaletteColour(colours.red, 0xFF0000)
--- ```
---
--- # Changes
---
--- - New in version 1.80pr1
---
--- @param index integer The colour whose palette should be changed.
--- @param colour integer A 24-bit integer representing the RGB value of the colour.
--- For instance the integer `0xFF0000` corresponds to the colour `#FF0000`.
---
--- @param r number The intensity of the red channel, between 0 and 1.
--- @param g number The intensity of the green channel, between 0 and 1.
--- @param b number The intensity of the blue channel, between 0 and 1.
---
--- @see colours.unpackRGB()
--- @see colours.packRGB()
---
--- @overload fun(index: integer, r: number, g: number, b: number)
function Redirect.setPaletteColour(index, colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#ty:Redirect:setPaletteColor)
---
--- Set the palette for a specific color.
---
--- ComputerCraft's palette system allows you to change how a specific color should be displayed.
--- For instance, you can make `colors.red` more red by setting its palette to `#FF0000`.
---
--- This does now allow you to draw more colors - you are still limited to 16 on the screen at one time -
--- but you can change which colors are used.
---
--- # Usage
---
--- - Change the red color from the default `#CC4C4C` to `#FF0000`.
---
--- ```lua
--- term.setPaletteColor(colors.red, 0xFF0000)
--- ```
---
--- # Changes
---
--- - New in version 1.80pr1
---
--- @param index integer The color whose palette should be changed.
--- @param colour integer A 24-bit integer representing the RGB value of the color.
--- For instance the integer `0xFF0000` corresponds to the color `#FF0000`.
---
--- @param r number The intensity of the red channel, between 0 and 1.
--- @param g number The intensity of the green channel, between 0 and 1.
--- @param b number The intensity of the blue channel, between 0 and 1.
---
--- @see colors.unpackRGB()
--- @see colors.packRGB()
---
--- @overload fun(index: integer, r: number, g: number, b: number)
function Redirect.setPaletteColor(index, colour) end
