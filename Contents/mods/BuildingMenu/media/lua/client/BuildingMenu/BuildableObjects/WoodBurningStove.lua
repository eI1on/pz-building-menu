local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local WoodBurningStove = BaseBuildableObject:derive("WoodBurningStove");

function WoodBurningStove:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return WoodBurningStove;
