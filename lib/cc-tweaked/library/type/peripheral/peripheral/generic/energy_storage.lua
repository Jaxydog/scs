--- @meta

--- [Official Documentation](https://tweaked.cc/generic_peripheral/energy_storage.html)
---
--- Methods for interacting with blocks which store energy.
---
--- This works with energy storage blocks, as well as generators and machines which consume energy.
---
--- > [!NOTE]
--- > Due to limitations with Forge's energy API, it is not possible to measure throughput (i.e. FE used/generated per tick).
---
--- # Changes
---
--- - New in version 1.94.0
---
--- @class cc.peripheral.Peripheral.Generic.EnergyStorage
local EnergyStorage = {}

--- [Official Documentation](https://tweaked.cc/generic_peripheral/energy_storage.html#v:getEnergy)
---
--- Get the energy of this block.
---
--- @return number energy The energy stored in this block, in FE.
function EnergyStorage.getEnergy() end

--- [Official Documentation](https://tweaked.cc/generic_peripheral/energy_storage.html#v:getEnergyCapacity)
---
--- Get the maximum amount of energy this block can store.
---
--- @return number capacity The energy capacity of this block.
function EnergyStorage.getEnergyCapacity() end
