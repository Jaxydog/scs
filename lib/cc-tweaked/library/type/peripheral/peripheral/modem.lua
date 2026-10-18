--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html)
---
--- Modems allow you to send messages between computers over long distances.
---
--- > [!INFO]
--- > Modems provide a fairly basic set of methods, which makes them very flexible but often hard to work with.
--- > The `rednet` API is built on top of modems, and provides a more user-friendly interface.
---
--- ## Sending and receiving messages.
---
--- Modems operate on a series of channels, a bit like frequencies on a radio. Any modem can send a message on a
--- particular channel, but only those which have opened the channel and are "listening in" can receive messages.
---
--- Channels are represented as an integer between 0 and 65535 inclusive. These channels don't have any defined meaning,
--- though some APIs or programs will assign a meaning to them. For instance, the `gps` module sends all its messages on
--- channel 65534 (`gps.CHANNEL_GPS`), while rednet uses channels equal to the computer's ID.
---
--- - Sending messages is done with the transmit message.
---
--- - Receiving messages is done by listening to the modem_message event.
---
--- ## Types of modem
---
--- CC: Tweaked comes with three kinds of modem, with different capabilities.
---
--- - Wireless modems: Wireless modems can send messages to any other wireless modem. They can be placed next to a
--- computer, or equipped as a pocket computer or turtle upgrade.
---
--- Wireless modems have a limited range, only sending messages to modems within 64 blocks.
--- This range increases linearly once the modem is above y=96, to a maximum of 384 at world height.
---
--- - Ender modems: These are upgraded versions of normal wireless modems. They do not have a distance limit, and can
--- send messages between dimensions.
---
--- - Wired modems: These send messages to other any other wired modems connected to the same network
--- (using Networking Cable). They also can be used to attach additional peripherals to a computer.
---
--- # Usage
---
--- - Wrap a modem and a message on channel 15, requesting a response on channel 43.
--- Then wait for a message to arrive on channel 43 and print it.
---
--- ```lua
--- local modem = assert(peripheral.find('modem'), 'No modem attached')
--- modem.open(43)
--- modem.transmit(15, 43, 'Hello, world!')
---
--- local event, side, channel, replyChannel, message, distance
--- repeat
---     event, side, channel, replyChannel, message, distance = os.pullEvent('modem_message')
--- until channel == 43
---
--- print(('Received a reply: %s'):format(message))
--- ```
---
--- @see cc.os.Event.ModemMessage
--- @see rednet
---
--- @class cc.peripheral.Peripheral.Modem
local Modem = {}

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:open)
---
--- Open a channel on a modem. A channel must be open in order to receive messages.
--- Modems can have up to 128 channels open at one time.
---
--- # Throws
---
--- - If the channel is out of range.
--- - If there are too many open channels.
---
--- @param channel integer The channel to open. This must be a number between 0 and 65535.
function Modem.open(channel) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:isOpen)
---
--- Check if a channel is open.
---
--- # Throws
---
--- - If the channel is out of range.
---
--- @param channel integer The channel to check.
---
--- @return boolean open Whether the channel is open.
function Modem.isOpen(channel) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:close)
---
--- Close an open channel, meaning it will no longer receive messages.
---
--- # Throws
---
--- - If the channel is out of range.
---
--- @param channel integer The channel to close.
function Modem.close(channel) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:closeAll)
---
--- Close all open channels.
function Modem.closeAll(channel) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:transmit)
---
--- Sends a modem message on a certain channel.
--- Modems listening on the channel will queue a modem_message event on adjacent computers.
---
--- > [!INFO]
--- > The channel does not need be open to send a message.
---
--- # Throws
---
--- - If the channel is out of range.
---
--- # Usage
---
--- - Wrap a modem and a message on channel 15, requesting a response on channel 43.
---
--- ```lua
--- local modem = assert(peripheral.find('modem'), 'No modem attached')
---
--- modem.transmit(15, 43, 'Hello, world!')
--- ```
---
--- @param channel integer The channel to send messages on.
--- @param replyChannel integer The channel that responses to this message should be sent on.
--- This can be the same as channel or entirely different.
--- The channel must have been opened on the sending computer in order to receive the replies.
--- @param payload any The object to send.
--- This can be any primitive type (boolean, number, string) as well as tables.
--- Other types (like functions), as well as metatables, will not be transmitted.
function Modem.transmit(channel, replyChannel, payload) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:isWireless)
---
--- Determine if this is a wired or wireless modem.
---
--- Some methods (namely those dealing with wired networks and remote peripherals) are only available on wired modems.
---
--- @return boolean wireless `true` if this is a wireless modem.
function Modem.isWireless() end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:getNamesRemote)
---
--- List all remote peripherals on the wired network.
---
--- If this computer is attached to the network, it will not be included in this list.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- @return string[] names Remote peripheral names on the network.
function Modem.getNamesRemote() end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:isPresentRemote)
---
--- Determine if a peripheral is available on this wired network.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- @param name string The peripheral's name.
---
--- @return boolean present If a peripheral is present with the given name.
---
--- @see peripheral.isPresent()
function Modem.isPresentRemote(name) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:getTypeRemote)
---
--- Get the type of a peripheral is available on this wired network.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- # Changes
---
--- - Changed in version 1.99: Peripherals can have multiple types - this function returns multiple values.
---
--- @param name? string The peripheral's name.
---
--- @return string? type The peripheral's type, or `nil` if it is not present.
---
--- @see peripheral.getType()
function Modem.getTypeRemote(name) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:hasTypeRemote)
---
--- Check a peripheral is of a particular type.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- # Changes
---
--- - New in version 1.99
---
--- @param name string The peripheral's name.
--- @param type string The type to check.
---
--- @return boolean? contains If a peripheral has a particular type, or `nil` if it is not present.
---
--- @see peripheral.getType()
function Modem.hasTypeRemote(name, type) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:getMethodsRemote)
---
--- Get all available methods for the remote peripheral with the given name.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- @param name string The peripheral's name.
---
--- @return string[]? methods A list of methods provided by this peripheral, or `nil` if it is not present.
---
--- @see peripheral.getMethods()
function Modem.getMethodsRemote(name) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:callRemote)
---
--- Call a method on a peripheral on this wired network.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- @param remoteName string The name of the peripheral to invoke the method on.
--- @param method string The name of the method.
--- @param ... any Additional arguments to pass to the method.
---
--- @return string value The return values of the peripheral method.
---
--- @see peripheral.call()
function Modem.callRemote(remoteName, method, ...) end

--- [Official Documentation](https://tweaked.cc/peripheral/modem.html#v:getNameLocal)
---
--- Returns the network name of the current computer, if the modem is on.
--- This may be used by other computers on the network to wrap this computer as a peripheral.
---
--- > [!INFO]
--- > This function only appears on wired modems. Check `isWireless` returns `false` before calling it.
---
--- # Changes
---
--- - New in version 1.80pr1.7
---
--- @return string? name The current computer's name on the wired network.
function Modem.getNameLocal() end
