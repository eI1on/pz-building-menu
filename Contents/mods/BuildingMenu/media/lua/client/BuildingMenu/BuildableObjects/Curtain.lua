local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Curtain = BaseBuildableObject:derive("Curtain");

function Curtain:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Curtain;
