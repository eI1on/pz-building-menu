local Wall = require("BuildingMenu/BuildableObjects/Wall");

local WallWithDoorFrame = Wall:derive("WallWithDoorFrame");

function WallWithDoorFrame:new(params)
    local o = Wall.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return WallWithDoorFrame;
