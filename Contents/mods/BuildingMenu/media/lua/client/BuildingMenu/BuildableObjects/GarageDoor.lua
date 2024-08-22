local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local GarageDoor = BaseBuildableObject:derive("GarageDoor");

function GarageDoor:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return GarageDoor;
