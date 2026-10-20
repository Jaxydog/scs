--- [Official Documentation](https://tweaked.cc/module/gps.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/gps.html)
---
--- Use modems to locate the position of the current turtle or computers.
---
--- This works by communicating with other computers (called GPS hosts) that already know their position,
--- finding the distance to those computers (with `modem_message`), and using that to derive its position from theirs
--- (with a process known as trilateration).
gps = {}

--- [Official Documentation](https://tweaked.cc/module/gps.html#v:CHANNEL_GPS)
---
--- The channel which GPS requests and responses are broadcast on.
gps.CHANNEL_GPS = 65534

--- [Official Documentation](https://tweaked.cc/module/gps.html#v:locate)
---
--- Tries to retrieve the computer or turtles own location.
---
--- @param timeout? number The maximum time in seconds taken to establish our position (default `2.0`).
--- @param debug? boolean Print debugging messages (default `false`).
---
--- @return integer? x This computer's `x` position.
--- @return integer? y This computer's `y` position.
--- @return integer? z This computer's `z` position.
---
--- @return_overload integer, integer, integer
--- @return_overload nil
function gps.locate(timeout, debug) end
