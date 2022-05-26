---@class Fish
Fish = class()
Fish.uuid = nil
Fish.name = nil
Fish.biteSize = nil

---Creates a new fish object
---@param uuid Uuid The fish's uuid
---@param name string The fish's name
---@param biteSize number The size of the bite a fish takes.
---@return Fish
function Fish.new(uuid, name, biteSize)
    local self = Fish()
    self.uuid = uuid
    self.name = name
    self.biteSize = biteSize
end

---Returns the fish's uuid
---@return Uuid
function Fish:getUuid()
    return self.uuid
end

---Returns the fish's name
---@return string
function Fish:getName()
    return self.name
end

---Returns the bite size a fish can bite off
---@return number
function Fish:getBiteSize()
    return self.biteSize
end
