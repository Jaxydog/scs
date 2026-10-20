--- [Official Documentation](https://tweaked.cc/library/cc.nft.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/library/cc.nft.html)
---
--- Read and draw `nft` ("Nitrogen Fingers Text") images.
---
--- `nft` ("Nitrogen Fingers Text") is a file format for drawing basic images. Unlike the images that
--- `paintutils.parseImage` uses, `nft` supports coloured text as well as simple coloured pixels.
---
--- # Usage
---
--- - Load an image from `example.nft` and draw it.
---
--- ```lua
--- local nft = require('cc.image.nft')
--- local image = assert(nft.load('data/example.nft'))
---
--- nft.draw(image, term.getCursorPos())
--- ```
---
--- # Changes
---
--- - New in version 1.90.0
local nft = {}

--- [Official Documentation](https://tweaked.cc/library/cc.nft.html#v:parse)
---
--- Parse an `nft` image from a string.
---
--- @param input string The image contents.
---
--- @return table The parsed image.
function nft.parse(input) end

--- [Official Documentation](https://tweaked.cc/library/cc.nft.html#v:parse)
---
--- Load an `nft` image from a file.
---
--- @param path string The file to load.
---
--- @return table? image The parsed image, or `nil` if the file does not exist or could not be loaded.
--- @return string? reason An error message explaining why the file could not be loaded.
---
--- @return_overload table
--- @return_overload nil, string
function nft.load(path) end

--- [Official Documentation](https://tweaked.cc/library/cc.nft.html#v:draw)
---
--- Draw an nft image to the screen.
---
--- @param image table An image, as returned from `load` or `parse`.
--- @param x integer The x position to start drawing at.
--- @param y integer The y position to start drawing at.
--- @param target cc.term.Redirect The terminal redirect to draw to. Defaults to the current terminal.
function nft.draw(image, x, y, target) end

return nft
