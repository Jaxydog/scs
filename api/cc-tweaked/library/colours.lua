--- [Official Documentation](https://tweaked.cc/module/colours.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/colours.html)
---
--- Constants and functions for colour values, suitable for working with term and redstone.
---
--- This is useful in conjunction with Bundled Cables from mods like Project Red,
--- and colours on Advanced Computers and Advanced Monitors.
---
--- For the non-British English version just replace colours with colours.
--- This alternative API is exactly the same,
--- except the colours use American English (e.g. `colours.grey` is spelled `colors.gray`).
---
--- On basic terminals (such as the Computer and Monitor),
--- all the colours are converted into greyscale.
--- This means you can still use all 16 colours on the screen, but they will appear as the nearest tint of grey.
--- You can check if a terminal supports colour by using the function `term.isColour`.
---
--- Greyscale colours are calculated by taking the average of the three components,
--- i.e. `(red + green + blue) / 3`.
---
--- @see colors
colours = {}

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:white)
---
--- Written as `0` in paint files and `term.blit`, has a default terminal colour of `#F0F0F0`.
colours.white = 0x1
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:orange)
---
--- Written as `1` in paint files and `term.blit`, has a default terminal colour of `#F2B233`.
colours.orange = 0x2
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:magenta)
---
--- Written as `2` in paint files and `term.blit`, has a default terminal colour of `#E57FD8`.
colours.magenta = 0x4
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:lightBlue)
---
--- Written as `3` in paint files and `term.blit`, has a default terminal colour of `#99B2F2`.
colours.lightBlue = 0x8
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:yellow)
---
--- Written as `4` in paint files and `term.blit`, has a default terminal colour of `#DEDE6C`.
colours.yellow = 0x10
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:lime)
---
--- Written as `5` in paint files and `term.blit`, has a default terminal colour of `#7FCC19`.
colours.lime = 0x20
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:pink)
---
--- Written as `6` in paint files and `term.blit`, has a default terminal colour of `#F2B2CC`.
colours.pink = 0x40
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:grey)
---
--- Written as `7` in paint files and `term.blit`, has a default terminal colour of `#4C4C4C`.
colours.grey = 0x80
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:lightGrey)
---
--- Written as `8` in paint files and `term.blit`, has a default terminal colour of `#999999`.
colours.lightGrey = 0x100
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:cyan)
---
--- Written as `9` in paint files and `term.blit`, has a default terminal colour of `#4C99B2`.
colours.cyan = 0x200
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:purple)
---
--- Written as `a` in paint files and `term.blit`, has a default terminal colour of `#B266E5`.
colours.purple = 0x400
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:blue)
---
--- Written as `b` in paint files and `term.blit`, has a default terminal colour of `#3366CC`.
colours.blue = 0x800
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:brown)
---
--- Written as `c` in paint files and `term.blit`, has a default terminal colour of `#7F664C`.
colours.brown = 0x1000
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:green)
---
--- Written as `d` in paint files and `term.blit`, has a default terminal colour of `#57A64E`.
colours.green = 0x2000
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:red)
---
--- Written as `e` in paint files and `term.blit`, has a default terminal colour of `#CC4C4C`.
colours.red = 0x4000
--- [Official Documentation](https://tweaked.cc/module/colours.html#v:black)
---
--- Written as `f` in paint files and `term.blit`, has a default terminal colour of `#111111`.
colours.black = 0x8000

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:combine)
---
--- Combines a set of colours (or sets of colours) into a larger set.
--- Useful for Bundled Cables.
---
--- # Usage
---
--- - Combine white, magenta, and light blue into a set.
---
--- ```lua
--- colours.combine(colours.white, colours.magenta, colours.lightBlue)
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param ... integer The colours to combine.
---
--- @return integer colours The union of the colour sets given in `...`.
function colours.combine(...) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:subtract)
---
--- Removes one or more colours (or sets of colours) from an initial set.
--- Useful for Bundled Cables.
---
--- Each parameter beyond the first may be a single colour or may be a set of colours
--- (in the latter case, all colours in the set are removed from the original set).
---
--- # Usage
---
--- - Subtract orange and white from lime.
---
--- ```lua
--- colours.subtract(colours.lime, colours.orange, colours.white)
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param colours integer The colour from which to subtract.
--- @param ... integer The colours to subtract.
---
--- @return integer colours The resulting colour.
function colours.subtract(colours, ...) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:test)
---
--- Tests whether `colour` is contained within `colours`.
--- Useful for Bundled Cables.
---
--- # Usage
---
--- - Test whether a set contains light blue.
---
--- ```lua
--- local colour_set = colours.combine(colours.white, colours.magenta, colours.lightBlue)
---
--- colours.test(colour_set, colours.lightBlue)
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param colours integer A colour, or colour set.
--- @param colour integer A colour or set of colours that `colours` should contain.
---
--- @return boolean contained If `colours` contains all colours within `colour`.
function colours.test(colours, colour) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:packRGB)
---
--- Combine a three-colour RGB value into one hexadecimal representation.
---
--- # Usage
---
--- - Convert an R, G, and B component into an integer colour.
---
--- ```lua
--- colours.packRGB(0.7, 0.2, 0.6)
--- -- => 0xb23399
--- ```
---
--- # Changes
---
--- - New in version 1.81.0
---
--- @param r number The red channel, should be between 0 and 1.
--- @param g number The green channel, should be between 0 and 1.
--- @param b number The blue channel, should be between 0 and 1.
---
--- @return integer rgb The combined hexadecimal colour.
---
--- @see colours.unpackRGB()
function colours.packRGB(r, g, b) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:unpackRGB)
---
--- Separate a hexadecimal RGB colour into its three constituent channels.
---
--- # Usage
---
--- - Separate an integer colour into its constituent R, G, and B components.
---
--- ```lua
--- colours.unpackRGB(0xb23399)
--- -- => 0.7, 0.2, 0.6
--- ```
---
--- # Changes
---
--- - New in version 1.81.0
---
--- @param rgb integer The combined hexadecimal colour.
---
--- @return number r The red channel, will be between 0 and 1.
--- @return number g The green channel, will be between 0 and 1.
--- @return number b The blue channel, will be between 0 and 1.
---
--- @see colours.packRGB()
function colours.unpackRGB(rgb) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:rgb8)
---
--- Either calls `colours.packRGB` or `colours.unpackRGB`, depending on how many arguments it receives.
---
--- > [!WARNING]
--- > This function is deprecated, either `colours.packRGB` or `colours.unpackRGB` should be used instead.
---
--- # Usage
---
--- - Convert an R, G, and B component into an integer colour.
---
--- ```lua
--- colours.rbg8(0.7, 0.2, 0.6)
--- -- => 0xb23399
--- ```
---
--- - Separate an integer colour into its constituent R, G, and B components.
---
--- ```lua
--- colours.rbg8(0xb23399)
--- -- => 0.7, 0.2, 0.6
--- ```
---
--- # Changes
---
--- - New in version 1.80pr1
--- - Changed in version 1.81.0: Deprecated in favor of `colours.(un)packRGB`.
---
--- @deprecated
---
--- @overload fun(rgb: integer): number, number, number
---
--- @param r number The red channel, as an argument to `colours.packRGB`.
--- @param g number The green channel, as an argument to `colours.packRGB`.
--- @param b number The blue channel, as an argument to `colours.packRGB`.
---
--- @return integer rgb The combined hexadecimal colour, as returned by `colours.packRGB`.
---
--- @see colours.packRGB()
function colours.rgb8(r, g, b) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:toBlit)
---
--- Converts the given colour to a paint/blit hex character (`0-9a-f`).
---
--- This is equivalent to converting `floor(log_2(colour))` to hexadecimal.
--- Values outside the range of a valid colour will error.
---
--- # Usage
---
--- - Convert red to its hexadecimal blit code.
---
--- ```lua
--- colours.toBlit(colours.red)
--- -- => 'e'
--- ```
---
--- # Changes
---
--- - New in version 1.94.0
---
--- @param colour integer The colour to convert.
---
--- @return string hex The blit hex code of the colour.
---
--- @see colours.fromBlit()
function colours.toBlit(colour) end

--- [Official Documentation](https://tweaked.cc/module/colours.html#v:fromBlit)
---
--- Converts the given paint/blit hex character (`0-9a-f`) to a colour.
---
--- This is equivalent to converting the hex character to a number and then `2 ^ decimal`.
---
--- # Usage
---
--- - Convert a hexadecimal blit code into its corresponding colour (red).
---
--- ```lua
--- colours.fromBlit('e')
--- -- => 16384
--- ```
---
--- # Changes
---
--- - New in version 1.105.0
---
--- @param hex string The paint/blit hex character to convert
---
--- @return integer colour The colour.
---
--- @see colours.toBlit()
function colours.fromBlit(hex) end
