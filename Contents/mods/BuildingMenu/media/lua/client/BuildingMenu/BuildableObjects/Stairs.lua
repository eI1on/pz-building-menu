local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Stairs = BaseBuildableObject:derive("Stairs");

function Stairs:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Stairs;
