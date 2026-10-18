--- @meta

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Websocket)
---
--- A WebSocket, which can be used to send and receive messages with a web server.
---
--- @class cc.http.WebSocket
---
--- @see http.websocket()
local WebSocket = {}

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Websocket:receive)
---
--- Wait for a message from the server.
---
--- # Throws
---
--- - If the WebSocket has been closed.
---
--- # Changes
---
--- - Changed in version 1.80pr1.13: Added return value indicating whether the message was binary.
--- - Changed in version 1.87.0: Added `timeout` argument.
--- - Changed in version 1.117.0: Added return value indicating why receiving the message failed.
---
--- @param timeout? number The number of seconds to wait if no message is received.
---
--- @return string? message The received message.
--- @return boolean | string data If this was a binary message, or the reason this failed if `message` is `nil`.
---
--- @return_overload string, boolean
--- @return_overload nil, string
function WebSocket.receive(timeout) end

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Websocket:send)
---
--- Send a WebSocket message to the connected server.
---
--- # Throws
---
--- - If the message is too large.
--- - If the WebSocket has been closed.
---
--- # Changes
---
--- - Changed in version 1.81.0: Added argument for binary mode.
---
--- @param message string The message to send.
--- @param binary? boolean Whether this message should be treated as a binary message.
function WebSocket.send(message, binary) end

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Websocket:close)
---
--- Close this WebSocket.
--- This will terminate the connection, meaning messages can no longer be sent or received along it.
function WebSocket.close() end

--- [Official Documentation](https://tweaked.cc/module/http.html#ty:Websocket:send)
---
--- Get a table containing the headers from the handshake response,
--- in a format similar to that required by `http.request`.
---
--- If multiple headers are sent with the same name, they will be combined with a comma.
---
--- # Usage
---
--- - Make a WebSocket connection and print the returned headers.
---
--- ```lua
--- local ws = http.websocket('wss://example.tweaked.cc/echo')
---
--- print(textutils.serialize(ws.getResponseHeaders()))
---
--- ws.close()
--- ```
---
--- # Changes
---
--- - New in version 1.117.0
---
--- @return table<string, string> headers The response's headers.
function WebSocket.getResponseHeaders() end
