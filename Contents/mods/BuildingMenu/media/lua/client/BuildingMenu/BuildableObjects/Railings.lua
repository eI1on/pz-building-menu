local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Railings = BaseBuildableObject:derive("Railings");

function Railings:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Railings;
