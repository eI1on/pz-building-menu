local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Container = BaseBuildableObject:derive("Container");

function Container:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Container;
