--- [Official Documentation](https://tweaked.cc/module/http.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/http.html)
---
--- Make HTTP requests, sending, and receiving data to a remote web server.
---
--- # Changes
---
--- - New in version 1.1
http = {}

--- [Official Documentation](https://tweaked.cc/module/http.html#v:get)
---
--- Make an HTTP `GET` request to the given URL.
---
--- # Usage
---
--- - Make a request and print the returned page.
---
--- ```lua
--- local request = http.get('https://example.tweaked.cc')
---
--- print(request.readAll())
---
--- request.close()
--- ```
---
--- # Changes
---
--- - Changed in version 1.63: Added argument for headers.
--- - Changed in version 1.80pr1: Response handles are now returned on error if available.
--- - Changed in version 1.80pr1: Added argument for binary handles.
--- - Changed in version 1.80pr1.6: Added support for table argument.
--- - Changed in version 1.86.0: Added `PATCH` and `TRACE` methods.
--- - Changed in version 1.105.0: Added support for custom timeouts.
--- - Changed in version 1.109.0: The returned response now reads the body as raw bytes,
---     rather than decoding from UTF-8.
---
--- @param url string The URL to request.
--- @param headers? table<string, string> Additional headers to send as part of this request.
--- @param binary? boolean Whether the response handle should be opened in binary mode (Defaults to `false`).
---
--- @return cc.http.Response? response The resulting HTTP response, wich can be read from.
--- @return string reason A message detailing why the request failed.
--- @return cc.http.Response? response The failing HTTP response, if available.
---
--- @return_overload cc.http.Response
--- @return_overload nil, string, cc.http.Response?
function http.get(url, headers, binary) end

--- @param request cc.http.Request
---
--- @return cc.http.Response? response The resulting HTTP response, wich can be read from.
--- @return string reason A message detailing why the request failed.
--- @return cc.http.Response? response The failing HTTP response, if available.
---
--- @return_overload cc.http.Response
--- @return_overload nil, string, cc.http.Response?
function http.get(request) end

--- [Official Documentation](https://tweaked.cc/module/http.html#v:post)
---
--- Make an HTTP `POST` request to the given URL.
---
--- # Changes
---
--- - New in version 1.31
--- - Changed in version 1.63: Added argument for headers.
--- - Changed in version 1.80pr1: Response handles are now returned on error if available.
--- - Changed in version 1.80pr1: Added argument for binary handles.
--- - Changed in version 1.80pr1.6: Added support for table argument.
--- - Changed in version 1.86.0: Added `PATCH` and `TRACE` methods.
--- - Changed in version 1.105.0: Added support for custom timeouts.
--- - Changed in version 1.109.0: The returned response now reads the body as raw bytes,
---     rather than decoding from UTF-8.
---
--- @param url string The URL to request.
--- @param body string The body of the `POST` request.
--- @param headers? table<string, string> Additional headers to send as part of this request.
--- @param binary? boolean Whether the response handle should be opened in binary mode (Defaults to `false`).
---
--- @return cc.http.Response? response The resulting HTTP response, wich can be read from.
--- @return string reason A message detailing why the request failed.
--- @return cc.http.Response? response The failing HTTP response, if available.
---
--- @return_overload cc.http.Response
--- @return_overload nil, string, cc.http.Response?
function http.post(url, body, headers, binary) end

--- @param request cc.http.Request Options for the request.
---
--- @return cc.http.Response? response The resulting HTTP response, wich can be read from.
--- @return string reason A message detailing why the request failed.
--- @return cc.http.Response? response The failing HTTP response, if available.
---
--- @return_overload cc.http.Response
--- @return_overload nil, string, cc.http.Response?
function http.post(request) end

--- [Official Documentation](https://tweaked.cc/module/http.html#v:request)
---
--- Asynchronously make an HTTP request to the given URL.
---
--- This returns immediately, a `http_success` or `http_failure` will be queued once the request has completed.
---
--- # Changes
---
--- - Changed in version 1.63: Added argument for headers.
--- - Changed in version 1.80pr1: Response handles are now returned on error if available.
--- - Changed in version 1.80pr1: Added argument for binary handles.
--- - Changed in version 1.80pr1.6: Added support for table argument.
--- - Changed in version 1.86.0: Added `PATCH` and `TRACE` methods.
--- - Changed in version 1.105.0: Added support for custom timeouts.
--- - Changed in version 1.109.0: The returned response now reads the body as raw bytes,
---     rather than decoding from UTF-8.
---
--- @param url string The URL to request.
--- @param body? string An optional string containing the body of the request.
--- If specified, a `POST` request will be made instead.
--- @param headers? table<string, string> Additional headers to send as part of this request.
--- @param binary? boolean Whether the response handle should be opened in binary mode (Defaults to `false`).
---
--- @see http.get()
--- @see http.post()
function http.request(url, body, headers, binary) end

--- @param request cc.http.Request Options for the request.
function http.request(request) end

--- [Official Documentation](https://tweaked.cc/module/http.html#v:checkURLAsync)
---
--- Asynchronously determine whether a URL can be requested.
---
--- If this returns `true`, one should also listen for `http_check` which will container further information
--- about whether the URL is allowed or not.
---
--- @param url string The URL to check.
---
--- @return boolean valid Whether this URL is valid. This does not imply that it is allowed.
--- @return string? reason A reason why this URL is not valid (e.g., it is malformed or blocked).
---
--- @return_overload true
--- @return_overload false, string
---
--- @see http.checkURL()
function http.checkURLAsync(url) end

--- [Official Documentation](https://tweaked.cc/module/http.html#v:checkURL)
---
--- Determine whether a URL can be requested.
---
--- If this returns `true`, one should also listen for `http_check` which will container further information
--- about whether the URL is allowed or not.
---
--- # Usage
---
--- - Check multiple URLs.
---
--- ```lua
--- print(http.checkURL('https://example.tweaked.cc'))
--- -- => 'true'
--- print(http.checkURL('http://localhost'))
--- -- => 'false Domain not permitted'
--- print(http.checkURL('not a URL'))
--- -- => 'false URL malformed'
--- ```
---
--- @param url string The URL to check.
---
--- @return boolean valid Whether this URL is valid. This does not imply that it is allowed.
--- @return string? reason A reason why this URL is not valid (e.g., it is malformed or blocked).
---
--- @return_overload true
--- @return_overload false, string
---
--- @see http.checkURLAsync()
function http.checkURL(url) end

--- [Official Documentation](https://tweaked.cc/module/http.html#v:checkURL)
---
--- Asynchronously open a WebSocket.
---
--- This returns immediately, a `websocket_success` or `websocket_failure` will be queued
--- once the request has completed.
---
--- # Changes
---
--- - New in version 1.80pr1.3
--- - Changed in version 1.95.3: Added `User-Agent` to default headers.
--- - Changed in version 1.105.0: Added support for table argument and custom timeout.
--- - Changed in version 1.109.0: Non-binary WebSocket messages now use the raw bytes rather than using UTF-8.
---
--- @param url string The WebSocket URL to connect to. This should have the `ws://` or `wss://` protocol.
--- @param headers? table<string, string> Additional headers to send as part of the initial WebSocket connection.
---
--- @see cc.os.Event.WebSocketSuccess
--- @see cc.os.Event.WebSocketFailure
function http.websocketAsync(url, headers) end

--- @param request cc.http.WebSocketRequest Options for the WebSocket.
function http.websocketAsync(request) end

--- [Official Documentation](https://tweaked.cc/module/http.html#v:checkURL)
---
--- Opens a WebSocket.
---
--- # Usage
---
--- - Connect to a WebSocket and send a message.
---
--- ```lua
--- local ws = http.websocket('wss://example.tweaked.cc/echo')
---
--- ws.send('Hello!')
---
--- print(ws.receive())
---
--- ws.close()
--- ```
---
--- # Changes
---
--- - New in version 1.80pr1.1
--- - Changed in version 1.80pr1.3: No longer asynchronous.
--- - Changed in version 1.95.3: Added `User-Agent` to default headers.
--- - Changed in version 1.105.0: Added support for table argument and custom timeout.
--- - Changed in version 1.109.0: Non-binary WebSocket messages now use the raw bytes rather than using UTF-8.
---
--- @param url string The WebSocket URL to connect to. This should have the `ws://` or `wss://` protocol.
--- @param headers? table<string, string> Additional headers to send as part of the initial WebSocket connection.
---
--- @return cc.http.WebSocket | boolean connection The WebSocket connection, or `false` if the connection failed.
--- @return string? reason The reason the connection failed.
---
--- @return_overload cc.http.WebSocket
--- @return_overload false, string
function http.websocket(url, headers) end

--- @param request cc.http.WebSocketRequest Options for the WebSocket.
---
--- @return cc.http.WebSocket | boolean connection The WebSocket connection, or `false` if the connection failed.
--- @return string? reason The reason the connection failed.
---
--- @return_overload cc.http.WebSocket
--- @return_overload false, string
function http.websocket(request) end
