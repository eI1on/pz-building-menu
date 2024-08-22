local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local ClothingDryer = BaseBuildableObject:derive("ClothingDryer");

function ClothingDryer:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return ClothingDryer;
