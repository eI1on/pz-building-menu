local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local HighFence = BaseBuildableObject:derive("HighFence");

function HighFence:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return HighFence;
