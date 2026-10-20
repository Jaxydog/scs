--- [Official Documentation](https://tweaked.cc/module/turtle.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/turtle.html)
---
--- Turtles are a robotic device, which can break and place blocks, attack mobs, and move about the world.
--- They have an internal inventory of 16 slots, allowing them to store blocks they have broken or would like to place.
---
--- ## Movement
---
--- Turtles are capable of moving through the world.
--- As turtles are blocks themselves, they are confined to Minecraft's grid, moving a single block at a time.
---
--- `turtle.forward` and `turtle.back` move the turtle in the direction it is facing, while `turtle.up` and
--- `turtle.down` move it up and down (as one may expect!). In order to move left or right, you first need to turn the
--- turtle using `turtle.turnLeft`/`turtle.turnRight` and then move forward or backwards.
---
--- > [!INFO]
--- > The name "turtle" comes from Turtle graphics, which originated from the Logo programming language.
--- > Here you'd move a turtle with various commands like "move 10" and "turn left", much like ComputerCraft's turtles!
---
--- > [!INFO]
--- > Many turtle functions can fail in various ways. For instance, a turtle cannot move forward if there's already a
--- > block there. Instead of erroring, functions which can fail either return `true` if they succeed, or `false` and
--- > some error message if they fail.
--- >
--- > Unexpected failures can often lead to strange behavior. It's often a good idea to check the return values of
--- > these functions, or wrap them in `assert` (for instance, use `assert(turtle.forward())` rather than
--- > `turtle.forward()`), so the program doesn't misbehave.
---
--- ## Turtle upgrades
---
--- While a normal turtle can move about the world and place blocks, its functionality is limited. Thankfully,
--- turtles can be upgraded with upgrades. Turtles have two upgrade slots, one on the left and right sides. Upgrades
--- can be equipped by crafting a turtle with the upgrade, or calling the `turtle.equipLeft`/`turtle.equipRight`
--- functions.
---
--- By default, any diamond tool may be used as an upgrade (though more may be added with datapacks). The diamond
--- pickaxe may be used to break blocks (with `turtle.dig`), while the sword can attack entities (`turtle.attack`).
--- Other tools have more niche use-cases, for instance hoes can till dirt.
---
--- Some peripherals (namely speakers and Ender and Wireless modems) can also be equipped as upgrades. These are then
--- accessible by accessing the `'left'` or `'right'` peripheral.
---
--- # Changes
---
--- - New in version 1.3
turtle = {}

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:native)
---
--- > [!WARNING]
--- > Historically this table behaved differently to the main turtle API, but this is no longer the case.
--- > You should not need to use it.
---
--- The builtin turtle API, without any generated helper functions.
---
--- @deprecated
turtle.native = {}

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:craft)
---
--- Craft a recipe based on the turtle's inventory. The turtle's inventory should set up like a crafting grid.
--- For instance, to craft sticks, slots 1 and 5 should contain planks.
--- All other slots should be empty, including those outside the crafting "grid".
---
--- `turtle.craft(0)` can be used to check whether the turtle contains a valid recipe, without actually crafting it.
---
--- # Throws
---
--- - When `limit` is less than 0 or greater than 64.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param limit? integer The maximum number of crafting steps to run (default 64).
---
--- @return boolean success If crafting succeeds.
--- @return string? reason A string describing why crafting failed.
---
--- @return_overload true
--- @return_overload false, string
function turtle.craft(limit) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:forward)
---
--- Move the turtle forward one block.
---
--- @return boolean success Whether the turtle could successfully move.
--- @return string? reason The reason the turtle could not move.
---
--- @return_overload true
--- @return_overload false, string
function turtle.forward() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:back)
---
--- Move the turtle backwards one block.
---
--- @return boolean success Whether the turtle could successfully move.
--- @return string? reason The reason the turtle could not move.
---
--- @return_overload true
--- @return_overload false, string
function turtle.back() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:up)
---
--- Move the turtle up one block.
---
--- @return boolean success Whether the turtle could successfully move.
--- @return string? reason The reason the turtle could not move.
---
--- @return_overload true
--- @return_overload false, string
function turtle.up() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:down)
---
--- Move the turtle down one block.
---
--- @return boolean success Whether the turtle could successfully move.
--- @return string? reason The reason the turtle could not move.
---
--- @return_overload true
--- @return_overload false, string
function turtle.down() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:turnLeft)
---
--- Rotate the turtle 90 degrees to the left.
---
--- @return boolean success Whether the turtle could successfully turn.
--- @return string? reason The reason the turtle could not turn.
---
--- @return_overload true
--- @return_overload false, string
function turtle.turnLeft() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:turnRight)
---
--- Rotate the turtle 90 degrees to the right.
---
--- @return boolean success Whether the turtle could successfully turn.
--- @return string? reason The reason the turtle could not turn.
---
--- @return_overload true
--- @return_overload false, string
function turtle.turnRight() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:dig)
---
--- Attempt to break the block in front of the turtle.
---
--- This requires a turtle tool capable of breaking the block. Diamond pickaxes (mining turtles) can break any
--- vanilla block breakable in survival mode, but other tools (such as axes) are more limited.
---
--- # Changes
---
--- - Changed in version 1.6: Added optional side argument.
---
--- @param side? cc.turtle.Side The specific tool to use. Should be "left" or "right".
---
--- @return boolean success Whether a block was broken.
--- @return string? reason The reason no block was broken.
---
--- @return_overload true
--- @return_overload false, string
function turtle.dig(side) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:digUp)
---
--- Attempt to break the block above the turtle. See dig for full details.
---
--- # Changes
---
--- - Changed in version 1.6: Added optional side argument.
---
--- @param side? cc.turtle.Side The specific tool to use. Should be "left" or "right".
---
--- @return boolean success Whether a block was broken.
--- @return string? reason The reason no block was broken.
---
--- @return_overload true
--- @return_overload false, string
function turtle.digUp(side) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:digDown)
---
--- Attempt to break the block below the turtle. See dig for full details.
---
--- # Changes
---
--- - Changed in version 1.6: Added optional side argument.
---
--- @param side? cc.turtle.Side The specific tool to use. Should be "left" or "right".
---
--- @return boolean success Whether a block was broken.
--- @return string? reason The reason no block was broken.
---
--- @return_overload true
--- @return_overload false, string
function turtle.digDown(side) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:place)
---
--- Place a block or item into the world in front of the turtle.
---
--- "Placing" an item allows it to interact with blocks and entities in front of the turtle. For instance, buckets
--- can pick up and place down fluids, and wheat can be used to breed cows.
--- However, you cannot use place to perform arbitrary block interactions, such as clicking buttons or flipping levers.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param text? string When placing a sign, set its contents to this text.
---
--- @return boolean success Whether the block could be placed.
--- @return string? reason The reason the block was not placed.
---
--- @return_overload true
--- @return_overload false, string
function turtle.place(text) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:placeUp)
---
--- Place a block or item into the world above the turtle.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param text? string When placing a sign, set its contents to this text.
---
--- @return boolean success Whether the block could be placed.
--- @return string? reason The reason the block was not placed.
---
--- @see turtle.place()
---
--- @return_overload true
--- @return_overload false, string
function turtle.placeUp(text) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:placeDown)
---
--- Place a block or item into the world above the turtle.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param text? string When placing a sign, set its contents to this text.
---
--- @return boolean success Whether the block could be placed.
--- @return string? reason The reason the block was not placed.
---
--- @see turtle.place()
---
--- @return_overload true
--- @return_overload false, string
function turtle.placeDown(text) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:drop)
---
--- Drop the currently selected stack into the inventory in front of the turtle, or as an item into the world if
--- there is no inventory.
---
--- # Throws
---
--- - If dropping an invalid number of items.
---
--- # Changes
---
--- - New in version 1.31
---
--- @param count? integer The number of items to drop. If not given, the entire stack will be dropped.
---
--- @return boolean success Whether items were dropped.
--- @return string? reason The reason the no items were dropped.
---
--- @see turtle.select()
---
--- @return_overload true
--- @return_overload false, string
function turtle.drop(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:dropUp)
---
--- Drop the currently selected stack into the inventory above the turtle, or as an item into the world if
--- there is no inventory.
---
--- # Throws
---
--- - If dropping an invalid number of items.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param count? integer The number of items to drop. If not given, the entire stack will be dropped.
---
--- @return boolean success Whether items were dropped.
--- @return string? reason The reason the no items were dropped.
---
--- @see turtle.select()
---
--- @return_overload true
--- @return_overload false, string
function turtle.dropUp(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:dropDown)
---
--- Drop the currently selected stack into the inventory below the turtle, or as an item into the world if
--- there is no inventory.
---
--- # Throws
---
--- - If dropping an invalid number of items.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param count? integer The number of items to drop. If not given, the entire stack will be dropped.
---
--- @return boolean success Whether items were dropped.
--- @return string? reason The reason the no items were dropped.
---
--- @see turtle.select()
---
--- @return_overload true
--- @return_overload false, string
function turtle.dropDown(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:select)
---
--- Change the currently selected slot.
---
--- The selected slot determines what slot actions like `drop` or `getItemCount` act on.
---
--- # Throws
---
--- - If the slot is out of range.
---
--- @param slot integer The slot to select.
---
--- @return true selected When the slot has been selected.
---
--- @see turtle.getSelectedSlot()
function turtle.select(slot) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getItemCount)
---
--- Get the number of items in the given slot.
---
--- # Throws
---
--- - If the slot is out of range.
---
--- @param slot? integer The slot we wish to check. Defaults to the selected slot.
---
--- @return integer count The number of items in this slot.
function turtle.getItemCount(slot) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getItemSpace)
---
--- Get the remaining number of items which may be stored in this stack.
---
--- For instance, if a slot contains 13 blocks of dirt, it has room for another 51.
---
--- # Throws
---
--- - If the slot is out of range.
---
--- @param slot? integer The slot we wish to check. Defaults to the selected slot.
---
--- @return integer space The space left in this slot.
function turtle.getItemSpace(slot) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:detect)
---
--- Check if there is a solid block in front of the turtle.
--- In this case, solid refers to any non-air or liquid block.
---
--- @return boolean detected If there is a solid block in front.
function turtle.detect() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:detectUp)
---
--- Check if there is a solid block above the turtle.
--- In this case, solid refers to any non-air or liquid block.
---
--- @return boolean detected If there is a solid block in front.
function turtle.detectUp() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:detectDown)
---
--- Check if there is a solid block below the turtle.
--- In this case, solid refers to any non-air or liquid block.
---
--- @return boolean detected If there is a solid block in front.
function turtle.detectBelow() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:compare)
---
--- Check if the block in front of the turtle is equal to the item in the currently selected slot.
---
--- # Changes
---
--- - New in version 1.31
---
--- @return boolean equal If the block and item are equal.
function turtle.compare() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:compareUp)
---
--- Check if the block above the turtle is equal to the item in the currently selected slot.
---
--- # Changes
---
--- - New in version 1.31
---
--- @return boolean equal If the block and item are equal.
function turtle.compareUp() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:compareDown)
---
--- Check if the block below the turtle is equal to the item in the currently selected slot.
---
--- # Changes
---
--- - New in version 1.31
---
--- @return boolean equal If the block and item are equal.
function turtle.compareDown() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:attack)
---
--- Attack the entity in front of the turtle.
---
--- # Changes
---
--- - New in version 1.4
--- - Changed in version 1.6: Added optional side argument.
---
--- @param side cc.turtle.Side The specific tool to use.
---
--- @return boolean success Whether an entity was attacked.
--- @return string? reason The reason nothing was attacked.
---
--- @return_overload true
--- @return_overload false, string
function turtle.attack(side) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:attackUp)
---
--- Attack the entity above the turtle.
---
--- # Changes
---
--- - New in version 1.4
--- - Changed in version 1.6: Added optional side argument.
---
--- @param side cc.turtle.Side The specific tool to use.
---
--- @return boolean success Whether an entity was attacked.
--- @return string? reason The reason nothing was attacked.
---
--- @return_overload true
--- @return_overload false, string
function turtle.attackUp(side) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:attackDown)
---
--- Attack the entity below the turtle.
---
--- # Changes
---
--- - New in version 1.4
--- - Changed in version 1.6: Added optional side argument.
---
--- @param side cc.turtle.Side The specific tool to use.
---
--- @return boolean success Whether an entity was attacked.
--- @return string? reason The reason nothing was attacked.
---
--- @return_overload true
--- @return_overload false, string
function turtle.attackDown(side) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:suck)
---
--- Suck an item from the inventory in front of the turtle, or from an item floating in the world.
---
--- This will pull items into the first acceptable slot, starting at the currently selected one.
---
--- # Throws
---
--- - If given an invalid number of items.
---
--- # Changes
---
--- - New in version 1.4
--- - Changed in version 1.6: Added an optional limit argument.
---
--- @param count? integer The number of items to suck. If not given, up to a stack of items will be picked up.
---
--- @return boolean success Whether items were picked up.
--- @return string? reason The reason the no items were picked up.
---
--- @return_overload true
--- @return_overload false, string
function turtle.suck(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:suckUp)
---
--- Suck an item from the inventory above the turtle, or from an item floating in the world.
---
--- # Throws
---
--- - If given an invalid number of items.
---
--- # Changes
---
--- - New in version 1.4
--- - Changed in version 1.6: Added an optional limit argument.
---
--- @param count? integer The number of items to suck. If not given, up to a stack of items will be picked up.
---
--- @return boolean success Whether items were picked up.
--- @return string? reason The reason the no items were picked up.
---
--- @return_overload true
--- @return_overload false, string
function turtle.suckUp(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:suckDown)
---
--- Suck an item from the inventory below the turtle, or from an item floating in the world.
---
--- # Throws
---
--- - If given an invalid number of items.
---
--- # Changes
---
--- - New in version 1.4
--- - Changed in version 1.6: Added an optional limit argument.
---
--- @param count? integer The number of items to suck. If not given, up to a stack of items will be picked up.
---
--- @return boolean success Whether items were picked up.
--- @return string? reason The reason the no items were picked up.
---
--- @return_overload true
--- @return_overload false, string
function turtle.suckDown(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getFuelLevel)
---
--- Get the maximum amount of fuel this turtle currently holds.
---
--- # Changes
---
--- - New in version 1.4
---
--- @return integer | 'unlimited' level The current amount of fuel a turtle this turtle has, or 'unlimited' if
--- turtles do not consume fuel when moving.
---
--- @see turtle.getFuelLimit()
--- @see turtle.refuel()
function turtle.getFuelLevel() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:refuel)
---
--- Refuel this turtle.
---
--- While most actions a turtle can perform (such as digging or placing blocks) are free, moving consumes fuel from
--- the turtle's internal buffer. If a turtle has no fuel, it will not move.
---
--- `refuel` refuels the turtle, consuming fuel items (such as coal or lava buckets) from the currently selected slot
--- and converting them into energy. This finishes once the turtle is fully refuelled or all items have been consumed.
---
--- # Throws
---
--- - If the refuel count is out of range.
---
--- # Usage
---
--- - Refuel a turtle from the currently selected slot.
---
--- ```lua
--- local level = turtle.getFuelLevel()
---
--- if level == 'unlimited' then
---     error('Turtle does not need fuel')
--- end
---
--- local success, reason = turtle.refuel()
---
--- if success then
---     local newLevel = turtle.getFuelLevel()
---
---     print(('Refuelled %d, current level is %d'):format(newLevel - level, newLevel))
--- else
---     printError(reason)
--- end
--- ```
---
--- - Check if the current item is a valid fuel source.
---
--- ```lua
--- local isFuel, reason = turtle.refuel(0)
---
--- if not isFuel then
---     printError(reason)
--- end
--- ```
---
--- # Changes
---
--- - New in version 1.4
---
--- @param count? isFuel The maximum number of items to consume.
--- One can pass `0` to check if an item is combustable or not.
---
--- @return boolean success If the turtle was refuelled.
--- @return string? reason The reason the turtle was not refuelled.
---
--- @see turtle.getFuelLevel()
--- @see turtle.getFuelLimit()
---
--- @return_overload true
--- @return_overload false, string
function turtle.refuel(count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:compareTo)
---
--- Compare the item in the currently selected slot to the item in another slot.
---
--- # Throws
---
--- - If the slot is out of range.
---
--- # Changes
---
--- - New in version 1.4
---
--- @param slot integer The slot to compare to.
---
--- @return boolean equal If the two items are equal.
function turtle.compareTo(slot) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:transferTo)
---
--- Move an item from the selected slot to another one.
---
--- # Throws
---
--- - If the slot is out of range.
--- - If the number of items is out of range.
---
--- # Changes
---
--- - New in version 1.45
---
--- @param slot integer The slot to move this item to.
--- @param count? integer The maximum number of items to move.
---
--- @return boolean moved If some items were successfully moved.
function turtle.transferTo(slot, count) end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getSelectedSlot)
---
--- Get the currently selected slot.
---
--- # Changes
---
--- - New in version 1.6
---
--- @return integer slot The current slot.
---
--- @see turtle.select()
function turtle.getSelectedSlot() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getFuelLimit)
---
--- Get the maximum amount of fuel this turtle can hold.
---
--- By default, normal turtles have a limit of 20,000 and advanced turtles of 100,000.
---
--- # Changes
---
--- - New in version 1.6
---
--- @return integer | 'unlimited' limit The maximum amount of fuel a turtle can hold, or 'unlimited' if
--- turtles do not consume fuel when moving.
---
--- @see turtle.getFuelLevel()
--- @see turtle.refuel()
function turtle.getFuelLimit() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:equipLeft)
---
--- Equip (or unequip) an item on the left side of this turtle.
---
--- This finds the item in the currently selected slot and attempts to equip it to the left side of the turtle.
--- The previous upgrade is removed and placed into the turtle's inventory. If there is no item in the slot, the
--- previous upgrade is removed, but no new one is equipped.
---
--- # Changes
---
--- - New in version 1.6
---
--- @return boolean success If the item was equipped.
--- @return string? reason The reason equipping this item failed.
---
--- @see turtle.equipRight()
--- @see turtle.getEquippedLeft()
---
--- @return_overload true
--- @return_overload false, string
function turtle.equipLeft() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:equipRight)
---
--- Equip (or unequip) an item on the right side of this turtle.
---
--- This finds the item in the currently selected slot and attempts to equip it to the right side of the turtle.
--- The previous upgrade is removed and placed into the turtle's inventory. If there is no item in the slot, the
--- previous upgrade is removed, but no new one is equipped.
---
--- # Changes
---
--- - New in version 1.6
---
--- @return boolean success If the item was equipped.
--- @return string? reason The reason equipping this item failed.
---
--- @see turtle.equipLeft()
--- @see turtle.getEquippedRight()
---
--- @return_overload true
--- @return_overload false, string
function turtle.equipRight() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getEquippedLeft)
---
--- Get the upgrade currently equipped on the left of the turtle.
---
--- This returns information about the currently equipped item.
---
--- # Changes
---
--- - New in version 1.116.0
---
--- @return cc.ItemDetails? details Information about the currently equipped item, or `nil` if no upgrade is equipped.
---
--- @see turtle.equipLeft()
--- @see cc.ItemDetails
function turtle.getEquippedLeft() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getEquippedRight)
---
--- Get the upgrade currently equipped on the right of the turtle.
---
--- This returns information about the currently equipped item.
---
--- # Changes
---
--- - New in version 1.116.0
---
--- @return cc.ItemDetails? details Information about the currently equipped item, or `nil` if no upgrade is equipped.
---
--- @see turtle.equipRight()
--- @see cc.ItemDetails
function turtle.getEquippedRight() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:inspect)
---
--- Get information about the block in front of the turtle.
---
--- # Usage
---
--- - Print information about the block in front of the turtle.
---
--- ```lua
--- local hasBlock, data = turtle.inspect()
---
--- if hasBlock then
---     print(textutils.serialize(data))
--- else
---     print('No block in front of the turtle')
--- end
--- ```
---
--- # Changes
---
--- - New in version 1.64
--- - Changed in version 1.76: Added block state to return value.
---
--- @return boolean exists Whether there is a block in front of the turtle.
--- @return cc.BlockDetails | string data Information about the block in front, or a message explaining that
--- there is no block.
---
--- @see cc.BlockDetails
---
--- @return_overload true, cc.BlockDetails
--- @return_overload false, string
function turtle.inspect() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:inspectUp)
---
--- Get information about the block above the turtle.
---
--- # Changes
---
--- - New in version 1.64
---
--- @return boolean exists Whether there is a block above the turtle.
--- @return cc.BlockDetails | string data Information about the block above, or a message explaining that
--- there is no block.
---
--- @see cc.BlockDetails
---
--- @return_overload true, cc.BlockDetails
--- @return_overload false, string
function turtle.inspectUp() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:inspectDown)
---
--- Get information about the block below the turtle.
---
--- # Changes
---
--- - New in version 1.64
---
--- @return boolean exists Whether there is a block below the turtle.
--- @return cc.BlockDetails | string data Information about the block below, or a message explaining that
--- there is no block.
---
--- @see cc.BlockDetails
---
--- @return_overload true, cc.BlockDetails
--- @return_overload false, string
function turtle.inspectDown() end

--- [Official Documentation](https://tweaked.cc/module/turtle.html#v:getItemDetail)
---
--- Get information about the items in the given slot.
---
--- # Throws
---
--- - If the slot is out of range.
---
--- # Usage
---
--- - Print the current slot's contents.
---
--- ```lua
--- print(textutils.serialize(turtle.getItemDetail()))
--- ```
---
--- # Changes
---
--- - New in version 1.64
--- - Changed in version 1.90.0: Added detailed parameter.
---
--- @param slot? integer The slot to get information about. Defaults to the selected slot.
--- @param detailed? boolean Whether to include "detailed" information. When `true`, the method will contain much more
--- information about the item at the cost of taking longer to run.
---
--- @return cc.ItemDetails? details Information about the item in this slot, or `nil` if it is empty.
---
--- @see cc.ItemDetails
function turtle.getItemDetail(slot, detailed) end
