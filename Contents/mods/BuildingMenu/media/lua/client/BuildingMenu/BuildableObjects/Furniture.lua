local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Furniture = BaseBuildableObject:derive("Furniture");

function Furniture:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Furniture;
