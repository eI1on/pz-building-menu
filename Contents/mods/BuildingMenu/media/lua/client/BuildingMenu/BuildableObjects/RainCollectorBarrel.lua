local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local RainCollectorBarrel = BaseBuildableObject:derive("RainCollectorBarrel");

function RainCollectorBarrel:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return RainCollectorBarrel;
