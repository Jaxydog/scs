--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html)
---
--- A pretty printer for rendering data structures in an aesthetically pleasing manner.
---
--- In order to display something using `cc.pretty`, you build up a series of documents. These behave a little bit
--- like strings; you can concatenate them together and then print them to the screen.
---
--- However, documents also allow you to control how they should be printed. There are several functions (such as
--- `nest` and `group`) which allow you to control the "layout" of the document. When you come to display the document,
--- the 'best' (most compact) layout is used.
---
--- The structure of this module is based on [A Prettier Printer](https://homepages.inf.ed.ac.uk/wadler/papers/prettier/prettier.pdf).
---
--- # Usage
---
--- - Print a table to the terminal.
---
--- ```lua
--- local pretty = require('cc.pretty')
---
--- pretty.pretty_print({ 1, 2, 3 })
--- ```
---
--- - Build a custom document and display it.
---
--- ```lua
--- local pretty = require('cc.pretty')
---
--- pretty.print(pretty.group(pretty.text('hello') .. pretty.space_line .. pretty.text('world')))
--- ```
---
--- # Changes
---
--- - New in version 1.87.0
local pretty = {}

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#ty:Doc)
---
--- A document containing formatted text, with multiple possible layouts.
---
--- Documents effectively represent a sequence of strings in alternative layouts, which we will try to print in the
--- most compact form necessary.
---
--- @class cc.pretty.Doc
---
--- @operator concat(cc.pretty.Doc | string): cc.pretty.Doc

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:empty)
---
--- An empty document.
---
--- @type cc.pretty.Doc
pretty.empty = nil

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:space)
---
--- A document with a single space in it.
---
--- @type cc.pretty.Doc
pretty.space = nil

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:line)
---
--- A line break. When collapsed with `group`, this will be replaced with `empty`.
---
--- @type cc.pretty.Doc
pretty.line = nil

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:space_line)
---
--- A line break. When collapsed with `group`, this will be replaced with `space`.
---
--- @type cc.pretty.Doc
pretty.space_line = nil

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:text)
---
--- Create a new document from a string.
---
--- If your string contains multiple lines, `group` will flatten the string into a single line, with spaces between
--- each line.
---
--- # Usage
---
--- - Write some blue text.
---
--- ```lua
--- local pretty = require('cc.pretty')
---
--- pretty.print(pretty.text('Hello!', colors.blue))
--- ```
---
--- @param text string The string to construct a new document with.
--- @param color? integer The colour this text should be printed with. If not given, we default to the current colour.
---
--- @return cc.pretty.Doc document The document with the provided text.
function pretty.text(text, color) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:concat)
---
--- Concatenate several documents together. This behaves very similar to string concatenation.
---
--- # Usage
---
--- - Concatenate two documents.
---
--- ```lua
--- local pretty = require('cc.pretty')
--- local doc1 = pretty.text('doc1')
--- local doc2 = pretty.text('doc2')
---
--- print(pretty.concat(doc1, doc2))
--- print(doc1 .. ' - ' .. doc2)
--- ```
---
--- @param ... cc.pretty.Doc | string The documents to concatenate.
---
--- @return cc.pretty.Doc document The concatenated documents.
function pretty.concat(...) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:nest)
---
--- Indent later lines of the given document with the given number of spaces.
---
--- For instance, nesting the document...
---
--- ```
--- foo
--- bar
--- ```
---
--- ...by two spaces will produce the document...
---
--- ```
--- foo
---   bar
--- ```
---
--- # Usage
---
--- - Nest a document.
---
--- ```lua
--- local pretty = require('cc.pretty')
---
--- print(pretty.nest(2, pretty.text('foo\nbar')))
--- ```
---
--- @param depth integer The number of spaces with which the document should be indented.
--- @param doc cc.pretty.Doc The document to indent.
---
--- @return cc.pretty.Doc document The nested document.
function pretty.nest(depth, doc) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:group)
---
--- Builds a document which is displayed on a single line if there is enough room, or as normal if not.
---
--- # Usage
---
--- - Uses group to show things being displayed on one or multiple lines.
---
--- ```lua
--- local pretty = require('cc.pretty')
--- local doc = pretty.group('Hello' .. pretty.space_line .. 'World')
---
--- print(pretty.render(doc, 5))
--- print(pretty.render(doc, 20))
--- ```
---
--- @param doc cc.pretty.Doc The document to group.
---
--- @return cc.pretty.Doc document The grouped document.
function pretty.group(doc) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:write)
---
--- Display a document on the terminal.
---
--- @param doc cc.pretty.Doc The document to render
--- @param ribbonFraction? number The maximum fraction of the width that we should write in (default `0.6`).
function pretty.write(doc, ribbonFraction) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:print)
---
--- Display a document on the terminal with a trailing newline.
---
--- @param doc cc.pretty.Doc The document to render
--- @param ribbonFraction? number The maximum fraction of the width that we should write in (default `0.6`).
function pretty.print(doc, ribbonFraction) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:render)
---
--- Render a document, converting it into a string.
---
--- @param doc cc.pretty.Doc The document to render.
--- @param width? integer The maximum width of this document. Note that long strings will not be wrapped to fit this
--- width - it is only used for finding the best layout.
--- @param ribbonFraction? number The maximum fraction of the width that we should write in (default `0.6`).
---
--- @return string rendered The rendered document as a string.
function pretty.render(doc, width, ribbonFraction) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:pretty)
---
--- @class cc.pretty.PrettyOptions
---
--- @param function_args? boolean Show the arguments to a function if known (`false` by default).
---
--- @param function_source? boolean Show where the function was defined, instead of `function: xxxxxxxx`
--- (`false` by default).

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:pretty)
---
--- Pretty-print an arbitrary object, converting it into a document.
---
--- This can then be rendered with `write` or `print`.
---
--- # Usage
---
--- - Display a table on the screen.
---
--- ```lua
--- local pretty = require('cc.pretty')
---
--- pretty.print(pretty.pretty({ 1, 2, 3 }))
--- ```
---
--- # Changes
---
--- - Changed in version 1.88.0: Added `options` argument.
---
--- @param obj any The object to pretty-print.
--- @param options? cc.pretty.PrettyOptions Controls how various properties are displayed.
---
--- @return cc.pretty.Doc document The object formatted as a document.
---
--- @see pretty_print()
function pretty.pretty(obj, options) end

--- [Official Documentation](https://tweaked.cc/library/cc.pretty.html#v:pretty_print)
---
--- A shortcut for calling `pretty` and `print` together.
---
--- # Usage
---
--- - Display a table on the screen.
---
--- ```lua
--- local pretty = require('cc.pretty')
---
--- pretty.pretty_print({ 1, 2, 3 })
--- ```
---
--- # Changes
---
--- - New in version 1.99
---
--- @param obj any The object to pretty-print.
--- @param options? cc.pretty.PrettyOptions Controls how various properties are displayed.
--- @param ribbonFraction? number The maximum fraction of the width that we should write in (default `0.6`).
---
--- @see pretty()
--- @see print()
function pretty.pretty_print(obj, options, ribbonFraction) end

return pretty
