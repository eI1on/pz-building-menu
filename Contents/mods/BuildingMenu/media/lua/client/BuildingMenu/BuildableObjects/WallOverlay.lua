local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local WallOverlay = BaseBuildableObject:derive("WallOverlay");

function WallOverlay:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return WallOverlay;
