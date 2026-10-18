--- @meta

--- [Official Documentation](https://tweaked.cc/generic_peripheral/fluid_storage.html)
---
--- Methods for interacting with tanks and other fluid storage blocks.
---
--- # Changes
---
--- - New in version 1.94.0
---
--- @class cc.peripheral.Peripheral.Generic.FluidStorage
local FluidStorage = {}

--- [Official Documentation](https://tweaked.cc/generic_peripheral/fluid_storage.html#v:tanks)
---
--- Get all "tanks" in this fluid storage.
---
--- Each tank either contains some amount of fluid or is empty.
--- Tanks with fluids inside will return some basic information about the fluid, including its name and amount.
---
--- The returned table is sparse, and so empty tanks will be `nil`.
--- It is recommended to loop over fields using `pairs` rather than `ipairs`.
---
--- @return (table?)[] tanks Basic information about all fluids in this fluid storage.
function FluidStorage.tanks() end

--- [Official Documentation](https://tweaked.cc/generic_peripheral/fluid_storage.html#v:pushFluid)
---
--- Move a fluid from one fluid container to another connected one.
---
--- This allows you to pull fluid in the current fluid container to another container on the same wired network.
--- Both containers must be attached to wired modems which are connected via a cable.
---
--- # Throws
---
--- - If the peripheral to transfer to doesn't exist or isn't a fluid container.
---
--- @param toName string The name of the peripheral/container to push to. This is the string given
--- to `peripheral.wrap`, and displayed by the wired modem.
--- @param limit? number The maximum amount of fluid to move.
--- @param fluidName? string The fluid to move. If not given, an arbitrary fluid will be chosen.
---
--- @return number moved The amount of fluid moved.
function FluidStorage.pushFluid(toName, limit, fluidName) end

--- [Official Documentation](https://tweaked.cc/generic_peripheral/fluid_storage.html#v:pullFluid)
---
--- Move a fluid from a connected fluid container into this one.
---
--- This allows you to pull fluid in the current fluid container from another container on the same wired network.
--- Both containers must be attached to wired modems which are connected via a cable.
---
--- # Throws
---
--- - If the peripheral to transfer to doesn't exist or isn't a fluid container.
---
--- @param fromName string The name of the peripheral/container to push to. This is the string given
--- to `peripheral.wrap`, and displayed by the wired modem.
--- @param limit? number The maximum amount of fluid to move.
--- @param fluidName? string The fluid to move. If not given, an arbitrary fluid will be chosen.
---
--- @return number moved The amount of fluid moved.
function FluidStorage.pullFluid(fromName, limit, fluidName) end
