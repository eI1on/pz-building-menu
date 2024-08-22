local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local FloorOverlay = BaseBuildableObject:derive("FloorOverlay");

function FloorOverlay:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return FloorOverlay;
