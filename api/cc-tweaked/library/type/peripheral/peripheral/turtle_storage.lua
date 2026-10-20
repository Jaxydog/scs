--- @meta

--- [Official Documentation](https://tweaked.cc/peripheral/turtle_storage.html)
---
--- A `turtle_storage` allows you to equip a shulker or other storage items with a turtle and access its contents.
---
--- This has largely the same methods and shape as inventory, with the exception that `pullItems` and `pushItems`
--- transfer to/from the turtle's inventory, rather than taking an inventory name.
---
--- # Changes
---
--- - New in version 1.121.0
---
--- @class cc.peripheral.Peripheral.TurtleStorage
local TurtleStorage = {}

--- [Official Documentation](https://tweaked.cc/peripheral/turtle_storage.html#v:size)
---
--- Get the size of this inventory.
---
--- @return integer slots The number of slots in this inventory.
function TurtleStorage.size() end

--- [Official Documentation](https://tweaked.cc/peripheral/turtle_storage.html#v:list)
---
--- List all items in this inventory. This returns a table, with an entry for each slot.
---
--- This returns data in the same format as `inventory.list`.
---
--- @return cc.ItemDetails[] items Basic information about all items in this inventory.
---
--- @see cc.ItemDetails
--- @see cc.peripheral.Peripheral.Generic.Inventory.list()
function TurtleStorage.list() end

--- [Official Documentation](https://tweaked.cc/peripheral/turtle_storage.html#v:getItemDetail)
---
--- Get detailed information about an item.
---
--- # Throws
---
--- - If the slot is out of range.
---
--- @param slot integer The slot to get information about.
---
--- @return cc.ItemDetails? item Information about the item in this slot, or `nil` if it is empty.
---
--- @see cc.ItemDetails
--- @see cc.peripheral.Peripheral.Generic.Inventory.getItemDetail()
function TurtleStorage.getItemDetail(slot) end

--- [Official Documentation](https://tweaked.cc/peripheral/turtle_storage.html#v:pushItems)
---
--- Push items from this inventory to the turtle.
---
--- # Throws
---
--- - If either source or destination slot is out of range.
---
--- @param fromSlot integer The slot in the current inventory to move items to.
--- @param limit? integer The maximum number of items to move. Defaults to the current stack limit.
--- @param toSlot? integer The slot in the turtle to move to. If not given, the item will be inserted into any slot.
---
--- @return integer count The number of transferred items.
function TurtleStorage.pushItems(fromSlot, limit, toSlot) end

--- [Official Documentation](https://tweaked.cc/peripheral/turtle_storage.html#v:pullItems)
---
--- Pull items from the turtle into this inventory.
---
--- # Throws
---
--- - If either source or destination slot is out of range.
---
--- @param fromSlot? integer The slot in the turtle inventory to move items from,
--- defaults to the currently selected slot.
--- @param limit? integer The maximum number of items to move. Defaults to the current stack limit.
--- @param toSlot? integer The slot in current inventory to move to.
--- If not given, the item will be inserted into any slot.
---
--- @return integer count The number of transferred items.
function TurtleStorage.pullItems(fromSlot, limit, toSlot) end
