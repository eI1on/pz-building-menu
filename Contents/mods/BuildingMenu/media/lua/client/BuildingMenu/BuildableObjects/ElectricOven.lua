local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local ElectricOven = BaseBuildableObject:derive("ElectricOven");

function ElectricOven:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return ElectricOven;
