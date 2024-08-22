local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Wall = BaseBuildableObject:derive("Wall");

function Wall:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Wall;
