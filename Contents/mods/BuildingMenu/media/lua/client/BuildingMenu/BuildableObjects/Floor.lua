local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Floor = BaseBuildableObject:derive("Floor");

function Floor:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Floor;
