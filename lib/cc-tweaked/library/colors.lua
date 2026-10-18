--- [Official Documentation](https://tweaked.cc/module/colors.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/colors.html)
---
--- Constants and functions for color values, suitable for working with term and redstone.
---
--- This is useful in conjunction with Bundled Cables from mods like Project Red,
--- and colors on Advanced Computers and Advanced Monitors.
---
--- For the non-American English version just replace colors with colors.
--- This alternative API is exactly the same,
--- except the colors use British English (e.g. `colors.gray` is spelled `colours.grey`).
---
--- On basic terminals (such as the Computer and Monitor),
--- all the colors are converted into grayscale.
--- This means you can still use all 16 colors on the screen, but they will appear as the nearest tint of gray.
--- You can check if a terminal supports color by using the function `term.isColor`.
---
--- Grayscale colors are calculated by taking the average of the three components,
--- i.e. `(red + green + blue) / 3`.
---
--- @see colours
colors = {}

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:white)
---
--- Written as `0` in paint files and `term.blit`, has a default terminal color of `#F0F0F0`.
colors.white = 0x1
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:orange)
---
--- Written as `1` in paint files and `term.blit`, has a default terminal color of `#F2B233`.
colors.orange = 0x2
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:magenta)
---
--- Written as `2` in paint files and `term.blit`, has a default terminal color of `#E57FD8`.
colors.magenta = 0x4
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:lightBlue)
---
--- Written as `3` in paint files and `term.blit`, has a default terminal color of `#99B2F2`.
colors.lightBlue = 0x8
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:yellow)
---
--- Written as `4` in paint files and `term.blit`, has a default terminal color of `#DEDE6C`.
colors.yellow = 0x10
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:lime)
---
--- Written as `5` in paint files and `term.blit`, has a default terminal color of `#7FCC19`.
colors.lime = 0x20
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:pink)
---
--- Written as `6` in paint files and `term.blit`, has a default terminal color of `#F2B2CC`.
colors.pink = 0x40
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:gray)
---
--- Written as `7` in paint files and `term.blit`, has a default terminal color of `#4C4C4C`.
colors.gray = 0x80
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:lightGray)
---
--- Written as `8` in paint files and `term.blit`, has a default terminal color of `#999999`.
colors.lightGray = 0x100
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:cyan)
---
--- Written as `9` in paint files and `term.blit`, has a default terminal color of `#4C99B2`.
colors.cyan = 0x200
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:purple)
---
--- Written as `a` in paint files and `term.blit`, has a default terminal color of `#B266E5`.
colors.purple = 0x400
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:blue)
---
--- Written as `b` in paint files and `term.blit`, has a default terminal color of `#3366CC`.
colors.blue = 0x800
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:brown)
---
--- Written as `c` in paint files and `term.blit`, has a default terminal color of `#7F664C`.
colors.brown = 0x1000
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:green)
---
--- Written as `d` in paint files and `term.blit`, has a default terminal color of `#57A64E`.
colors.green = 0x2000
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:red)
---
--- Written as `e` in paint files and `term.blit`, has a default terminal color of `#CC4C4C`.
colors.red = 0x4000
--- [Official Documentation](https://tweaked.cc/module/colors.html#v:black)
---
--- Written as `f` in paint files and `term.blit`, has a default terminal color of `#111111`.
colors.black = 0x8000

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:combine)
---
--- Combines a set of colors (or sets of colors) into a larger set.
--- Useful for Bundled Cables.
---
--- # Usage
---
--- - Combine white, magenta, and light blue into a set.
---
--- ```lua
--- colors.combine(colors.white, colors.magenta, colors.lightBlue)
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param ... integer The colors to combine.
---
--- @return integer colors The union of the color sets given in `...`.
function colors.combine(...) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:subtract)
---
--- Removes one or more colors (or sets of colors) from an initial set.
--- Useful for Bundled Cables.
---
--- Each parameter beyond the first may be a single color or may be a set of colors
--- (in the latter case, all colors in the set are removed from the original set).
---
--- # Usage
---
--- - Subtract orange and white from lime.
---
--- ```lua
--- colors.subtract(colors.lime, colors.orange, colors.white)
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param colors integer The color from which to subtract.
--- @param ... integer The colors to subtract.
---
--- @return integer colors The resulting color.
function colors.subtract(colors, ...) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:test)
---
--- Tests whether `color` is contained within `colors`.
--- Useful for Bundled Cables.
---
--- # Usage
---
--- - Test whether a set contains light blue.
---
--- ```lua
--- local color_set = colors.combine(colors.white, colors.magenta, colors.lightBlue)
---
--- colors.test(color_set, colors.lightBlue)
--- ```
---
--- # Changes
---
--- - New in version 1.2
---
--- @param colors integer A color, or color set.
--- @param color integer A color or set of colors that `colors` should contain.
---
--- @return boolean contained If `colors` contains all colors within `color`.
function colors.test(colors, color) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:packRGB)
---
--- Combine a three-color RGB value into one hexadecimal representation.
---
--- # Usage
---
--- - Convert an R, G, and B component into an integer color.
---
--- ```lua
--- colors.packRGB(0.7, 0.2, 0.6)
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
--- @return integer rgb The combined hexadecimal color.
---
--- @see colors.unpackRGB()
function colors.packRGB(r, g, b) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:unpackRGB)
---
--- Separate a hexadecimal RGB color into its three constituent channels.
---
--- # Usage
---
--- - Separate an integer color into its constituent R, G, and B components.
---
--- ```lua
--- colors.unpackRGB(0xb23399)
--- -- => 0.7, 0.2, 0.6
--- ```
---
--- # Changes
---
--- - New in version 1.81.0
---
--- @param rgb integer The combined hexadecimal color.
---
--- @return number r The red channel, will be between 0 and 1.
--- @return number g The green channel, will be between 0 and 1.
--- @return number b The blue channel, will be between 0 and 1.
---
--- @see colors.packRGB()
function colors.unpackRGB(rgb) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:rgb8)
---
--- Either calls `colors.packRGB` or `colors.unpackRGB`, depending on how many arguments it receives.
---
--- > [!WARNING]
--- > This function is deprecated, either `colors.packRGB` or `colors.unpackRGB` should be used instead.
---
--- # Usage
---
--- - Convert an R, G, and B component into an integer color.
---
--- ```lua
--- colors.rbg8(0.7, 0.2, 0.6)
--- -- => 0xb23399
--- ```
---
--- - Separate an integer color into its constituent R, G, and B components.
---
--- ```lua
--- colors.rbg8(0xb23399)
--- -- => 0.7, 0.2, 0.6
--- ```
---
--- # Changes
---
--- - New in version 1.80pr1
--- - Changed in version 1.81.0: Deprecated in favor of `colors.(un)packRGB`.
---
--- @deprecated
---
--- @overload fun(rgb: integer): number, number, number
---
--- @param r number The red channel, as an argument to `colors.packRGB`.
--- @param g number The green channel, as an argument to `colors.packRGB`.
--- @param b number The blue channel, as an argument to `colors.packRGB`.
---
--- @return integer rgb The combined hexadecimal color, as returned by `colors.packRGB`.
---
--- @see colors.packRGB()
function colors.rgb8(r, g, b) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:toBlit)
---
--- Converts the given color to a paint/blit hex character (`0-9a-f`).
---
--- This is equivalent to converting `floor(log_2(color))` to hexadecimal.
--- Values outside the range of a valid color will error.
---
--- # Usage
---
--- - Convert red to its hexadecimal blit code.
---
--- ```lua
--- colors.toBlit(colors.red)
--- -- => 'e'
--- ```
---
--- # Changes
---
--- - New in version 1.94.0
---
--- @param color integer The color to convert.
---
--- @return string hex The blit hex code of the color.
---
--- @see colors.fromBlit()
function colors.toBlit(color) end

--- [Official Documentation](https://tweaked.cc/module/colors.html#v:fromBlit)
---
--- Converts the given paint/blit hex character (`0-9a-f`) to a color.
---
--- This is equivalent to converting the hex character to a number and then `2 ^ decimal`.
---
--- # Usage
---
--- - Convert a hexadecimal blit code into its corresponding color (red).
---
--- ```lua
--- colors.fromBlit('e')
--- -- => 16384
--- ```
---
--- # Changes
---
--- - New in version 1.105.0
---
--- @param hex string The paint/blit hex character to convert
---
--- @return integer color The color.
---
--- @see colors.toBlit()
function colors.fromBlit(hex) end
