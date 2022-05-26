---@class Bait
Bait = class()
Bait.uuid = nil
Bait.name = nil
Bait.biteSize = nil
Bait.remains = nil

--- Creates a new bait object
---@param uuid Uuid The bait's uuid
---@param name string The bait's name
---@param biteSize number The bait's minimum bite size to be taken
---@return Bait
function Bait.new(uuid, name, biteSize)
    local self = Bait()
    self.uuid = uuid
    self.name = name
    self.biteSize = biteSize
    self.remains = 1

    return self
end

---Returns the bait's uuid
---@return Uuid
function Bait:getUuid()
    return self.uuid
end

---Returns the bait's name
---@return string
function Bait:getName()
    return self.name
end

---Returns the minimum size of a bite that can be bitten off
---@return number
function Bait:getBiteSize()
    return self.biteSize
end

---Returns whether a bait has any biteable remains left
---@return boolean
function Bait:hasRemainsLeft()
    return self.remains > 0
end

---Returns the percentage of the remains left
---@return number
function Bait:getRemainsLeft()
    return self.remains
end

---Bites off a fish specific amount or at least the minimum bite size of the bait.
---Returns true whether a bite could be taken, otherwise false
---@param fish Fish The fish biting the bait
---@return boolean
function Bait:biteOff(fish)
    if not self:hasRemainsLeft() then
        return false
    end

    self.remains = self.remains - math.max(self.biteSize, fish:getBiteSize())

    return true
end
