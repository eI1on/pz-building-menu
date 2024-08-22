local Wall = require("BuildingMenu/BuildableObjects/Wall");

local WallWithWindowFrame = Wall:derive("WallWithWindowFrame");

function WallWithWindowFrame:new(params)
    local o = Wall.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return WallWithWindowFrame;
