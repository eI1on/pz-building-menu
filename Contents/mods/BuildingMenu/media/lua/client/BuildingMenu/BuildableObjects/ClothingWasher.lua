local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local ClothingWasher = BaseBuildableObject:derive("ClothingWasher");

function ClothingWasher:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return ClothingWasher;
