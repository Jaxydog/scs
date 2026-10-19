--- [Official Documentation](https://tweaked.cc/module/term.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/term.html)
---
--- Interact with a computer's terminal or monitors, writing text and drawing ASCII graphics.
---
--- ## Writing to terminal
---
--- The simplest operation one can perform on a terminal is displaying (or writing) some text.
--- This can be performed with the `term.write` method.
---
--- ```lua
--- term.write('Hello, world!')
--- ```
---
--- When you write text, this advances the cursor, so the next call to `term.write` will write text immediately
--- after the previous one.
---
--- ```lua
--- term.write('Hello, world!')
--- term.write('Some more text')
--- ```
---
--- `term.getCursorPos` and `term.setCursorPos` can be used to manually change the cursor's position.
---
--- ```lua
--- term.clear()
---
--- term.setCursorPos(1, 1)
--- term.write('First line')
---
--- term.setCursorPos(20, 2)
--- term.write('Second line')
--- ```
---
--- `term.write` is a relatively basic and low-level function, and does not handle more advanced features such as line
--- breaks or word wrapping.
--- If you just want to display text to the screen, you probably want to use `print` or `write` instead.
---
--- # Colors
---
--- So far we've been writing text in black and white. However, advanced computers are also capable of displaying text
--- in a variety of colors, with the `term.setTextColor` and `term.setBackgroundColor` functions.
---
--- ```lua
--- print('This text is white')
--- term.setTextColour(colors.green)
--- print('This text is green')
--- ```
---
--- These functions accept any of the constants from the `colors` API. Combinations of colors may be accepted, but
--- will only display a single color (typically following the behavior of `colors.toBlit`).
---
--- The `paintutils` API provides several helpful functions for displaying graphics using `term.setBackgroundColor`.
term = {}

--- [Official Documentation](https://tweaked.cc/module/term.html#v:nativePaletteColour)
---
--- Get the default palette value for a colour.
---
--- # Throws
---
--- - When given an invalid colour.
---
--- # Changes
---
--- - New in version 1.81.0
---
--- @param colour integer The colour whose palette should be fetched.
---
--- @return number r The red channel, will be between 0 and 1.
--- @return number g The green channel, will be between 0 and 1.
--- @return number b The blue channel, will be between 0 and 1.
---
--- @see cc.term.Redirect.setPaletteColour()
function term.nativePaletteColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:nativePaletteColor)
---
--- Get the default palette value for a color.
---
--- # Throws
---
--- - When given an invalid color.
---
--- # Changes
---
--- - New in version 1.81.0
---
--- @param color integer The color whose palette should be fetched.
---
--- @return number r The red channel, will be between 0 and 1.
--- @return number g The green channel, will be between 0 and 1.
--- @return number b The blue channel, will be between 0 and 1.
---
--- @see cc.term.Redirect.setPaletteColor()
function term.nativePaletteColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:write)
---
--- Write `text` at the current cursor position, moving the cursor to the end of the text.
---
--- Unlike functions like `_G.write` and `print`, this does not wrap the text - it simply copies the text to the
--- current terminal line.
function term.write(text) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:scroll)
---
--- Move all positions up (or down) by `y` pixels.
---
--- Every pixel in the terminal will be replaced by the line `y` pixels below it.
--- If `y` is negative, it will copy pixels from above instead.
---
--- @param y integer The number of lines to move up by. This may be a negative number.
function term.scroll(y) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getCursorPos)
---
--- Get the position of the cursor.
---
--- @return integer x The x position of the cursor.
--- @return integer y The y position of the cursor.
function term.getCursorPos() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setCursorPos)
---
--- Set the position of the cursor. Terminal writes will begin from this position.
---
--- @param x integer The x position of the cursor.
--- @param y integer The y position of the cursor.
function term.setCursorPos(x, y) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getCursorBlink)
---
--- Checks if the cursor is currently blinking.
---
--- # Changes
---
--- - New in version 1.80pr1.9
---
--- @return boolean blinking If the cursor is blinking.
function term.getCursorBlink() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setCursorBlink)
---
--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---
--- @param blink boolean Whether the cursor should blink.
function term.setCursorBlink(blink) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getSize)
---
--- Get the size of the terminal.
---
--- @return integer width The terminal's width.
--- @return integer height The terminal's height.
function term.getSize() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:clear)
---
--- Clears the terminal, filling it with the current background colour.
function term.clear() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:clearLine)
---
--- Clears the line the cursor is currently on, filling it with the current background colour.
function term.clearLine() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getTextColour)
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
function term.getTextColour() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getTextColor)
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
function term.getTextColor() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setTextColour)
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
function term.setTextColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setTextColor)
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
function term.setTextColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getBackgroundColour)
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
function term.getBackgroundColour() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getBackgroundColor)
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
function term.getBackgroundColor() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setBackgroundColour)
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
function term.setBackgroundColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setBackgroundColor)
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
function term.setBackgroundColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:isColour)
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
function term.isColour() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:isColor)
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
function term.isColor() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:blit)
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
function term.blit(text, textColor, backgroundColor) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getPaletteColour)
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
function term.getPaletteColour(colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:getPaletteColor)
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
function term.getPaletteColor(color) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setPaletteColour)
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
function term.setPaletteColour(index, colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:setPaletteColor)
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
function term.setPaletteColor(index, colour) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:redirect)
---
--- Redirects terminal output to a monitor, a `window`, or any other custom terminal object.
--- Once the redirect is performed, any calls to a "term" function - or to a function that makes use of a term
--- function, as `print` - will instead operate with the new terminal object.
---
--- A "terminal object" is simply a table that contains functions with the same names - and general features - as
--- those found in the `term` table. For example, a wrapped monitor is suitable.
---
--- The redirect can be undone by pointing back to the previous terminal object (which this function returns
--- whenever you switch).
---
--- # Usage
---
--- - Redirect to a monitor on the right of the computer.
---
--- ```lua
--- term.redirect(peripheral.wrap('right'))
--- ```
---
--- # Changes
---
--- - New in version 1.31
---
--- @param target cc.term.Redirect The terminal redirect the `term` API will draw to.
---
--- @return cc.term.Redirect previous The previous redirect object, as returned by `term.current`.
function term.redirect(target) end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:current)
---
--- Returns the current terminal object of the computer.
---
--- # Usage
---
--- - Create a new window which draws to the curent redirect target.
---
--- ```lua
--- window.create(term.current(), 1, 1, 10, 10)
--- ```
---
--- # Changes
---
--- - New in version 1.6
---
--- @return cc.term.Redirect redirect The current terminal redirect.
function term.current() end

--- [Official Documentation](https://tweaked.cc/module/term.html#v:native)
---
--- Get the native terminal object of the current computer.
---
--- It is recommended you do not use this function unless you absolutely have to. In a multi-tasked environment,
--- `term.native` will not be the current terminal object, and so drawing may interfere with other programs.
---
--- # Changes
---
--- - New in version 1.6
---
--- @return cc.term.Redirect redirect The native terminal redirect.
function term.native() end
