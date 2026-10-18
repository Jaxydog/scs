--- @meta

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Response)
---
--- An HTTP response. This provides the same methods as a file, though provides several request-specific methods.
---
--- @class cc.http.Response: cc.fs.ReadHandle
---
--- @see http.request()
local Response = {}

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Response:getResponseCode)
---
--- Returns the response code and response message returned by the server.
---
--- # Changes
---
--- - Changed in version 1.80pr1.13: Added response message return value.
---
--- @return integer code The response code (i.e., `200`)
--- @return string message The response message (i.e., `'OK'`)
function Response.getResponseCode() end

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Response:getResponseHeaders)
---
--- Get a table containing the response's headers, in a format similar to that required by `http.request`.
--- If multiple headers are sent with the same name, they will be combined with a comma.
---
--- # Usage
---
--- - Make a request and print the returned headers.
---
--- ```lua
--- local request = http.get('https://example.tweaked.cc')
---
--- print(textutils.serialize(request.getResponseHeaders()))
---
--- request.close()
--- ```
---
--- @return table<string, string> headers The response's headers.
function Response.getResponseCode() end
