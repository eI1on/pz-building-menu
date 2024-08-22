local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local LightSource = BaseBuildableObject:derive("LightSource");

function LightSource:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return LightSource;
