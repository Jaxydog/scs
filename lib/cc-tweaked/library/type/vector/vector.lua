--- @meta

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector)
---
--- A 3-dimensional vector, with `x`, `y`, and `z` values.
---
--- This is suitable for representing both position and directional vectors.
---
--- @class cc.vector.Vector
---
--- @operator add(cc.vector.Vector): cc.vector.Vector
--- @operator sub(cc.vector.Vector): cc.vector.Vector
--- @operator mul(number): cc.vector.Vector
--- @operator div(number): cc.vector.Vector
--- @operator unm: cc.vector.Vector
local Vector = {}

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:add)
---
--- Adds two vectors together.
---
--- # Usage
---
--- - Add two vectors.
---
--- ```lua
--- v1:add(v2)
--- v1 + v2
--- ```
---
--- @param o cc.vector.Vector The second vector to add.
---
--- @return cc.vector.Vector vector The resulting vector.
function Vector:add(o) end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:sub)
---
--- Subtracts one vector from another.
---
--- # Usage
---
--- - Subtract two vectors.
---
--- ```lua
--- v1:sub(v2)
--- v1 - v2
--- ```
---
--- @param o cc.vector.Vector The vector to subtract.
---
--- @return cc.vector.Vector vector The resulting vector.
function Vector:sub(o) end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:mul)
---
--- Multiplies a vector by a scalar value.
---
--- # Usage
---
--- - Multiply two vectors.
---
--- ```lua
--- vector.new(1, 2, 3):mul(3)
--- vector.new(1, 2, 3) * 3
--- ```
---
--- @param factor number The scalar value to multiply with.
---
--- @return cc.vector.Vector vector A vector with value `(x * m, y * m, z * m)`.
function Vector:mul(factor) end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:div)
---
--- Divides a vector by a scalar value.
---
--- # Usage
---
--- - Divide two vectors.
---
--- ```lua
--- vector.new(1, 2, 3):div(3)
--- vector.new(1, 2, 3) / 3
--- ```
---
--- @param factor number The scalar value to divide by.
---
--- @return cc.vector.Vector vector A vector with value `(x / m, y / m, z / m)`.
function Vector:div(factor) end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:unm)
---
--- Negate a vector.
---
--- # Usage
---
--- - Negate a vector.
---
--- ```lua
--- -vector.new(1, 2, 3)
--- ```
function Vector:unm() end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:cross)
---
--- Compute the cross product of two vectors.
---
--- # Usage
---
--- - Compute a cross product
---
--- ```lua
--- v1:cross(v2)
--- ```
---
--- @param o cc.vector.Vector The second vector to compute the cross product of.
---
--- @return cc.vector.Vector vector The cross product of `self` and `o`.
function Vector:cross(o) end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:length)
---
--- Get the length (also referred to as magnitude) of this vector.
---
--- @return number length The length of this vector.
function Vector:length() end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:normalize)
---
--- Divide this vector by its length, producing with the same direction, but of length 1.
---
--- @return cc.vector.Vector vector The normalized vector.
function Vector:normalize() end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:round)
---
--- Construct a vector with each dimension rounded to the nearest value.
---
--- @param tolerance? number The tolerance that we should round to, defaulting to 1. For instance, a tolerance of 0.5
--- will round to the nearest 0.5.
---
--- @return cc.vector.Vector vector The rounded vector.
function Vector:round(tolerance) end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:tostring)
---
--- Convert this vector into a string, for pretty printing.
---
--- # Usage
---
--- - Convert a vector to a string.
---
--- ```lua
--- v:tostring()
--- tostring(v)
--- ```
---
--- @return string value This vector's string representation.
function Vector:tostring() end

--- [Official Documentation](https://tweaked.cc/module/vector.html#ty:Vector:equals)
---
--- Check for equality between two vectors.
---
--- @param other cc.vector.Vector The second vector to compare to.
---
--- @return boolean equal Whether or not the vectors are equal.
function Vector:equals(other) end
