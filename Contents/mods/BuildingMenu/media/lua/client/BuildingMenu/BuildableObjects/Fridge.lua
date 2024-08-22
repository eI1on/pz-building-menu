local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Fridge = BaseBuildableObject:derive("Fridge");

function Fridge:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Fridge;
