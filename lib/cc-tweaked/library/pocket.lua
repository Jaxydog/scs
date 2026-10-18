--- [Official Documentation](https://tweaked.cc/module/pocket.html)
---
--- @meta

--- [Official Documentation](https://tweaked.cc/module/pocket.html)
---
--- Control the current pocket computer, adding or removing upgrades.
---
--- This API is only available on pocket computers.
--- As such, you may use its presence to determine what kind of computer you are using:
---
--- ```lua
--- if pocket then
---     print('On a pocket computer')
--- else
---     print('On something else')
--- end
--- ```
pocket = {}

--- [Official Documentation](https://tweaked.cc/module/pocket.html#v:equipBack)
---
--- Search the player's inventory for another upgrade,
--- replacing the existing one with that item if found.
---
--- This inventory search starts from the player's currently selected slot,
--- allowing you to prioritise upgrades.
---
--- @return boolean success If an item was equipped.
--- @return string? reason The reason an item was not equipped.
---
--- @return_overload true
--- @return_overload false, string
function pocket.equipBack() end

--- [Official Documentation](https://tweaked.cc/module/pocket.html#v:unequipBack)
---
--- Remove the pocket computer's current upgrade.
---
--- @return boolean success If the upgrade was unequipped.
--- @return string? reason The reason the upgrade was not unequipped.
---
--- @return_overload true
--- @return_overload false, string
function pocket.unequipBack() end
