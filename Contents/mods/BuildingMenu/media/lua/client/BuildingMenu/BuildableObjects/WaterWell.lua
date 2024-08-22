local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local WaterWell = BaseBuildableObject:derive("WaterWell");

function WaterWell:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return WaterWell;
