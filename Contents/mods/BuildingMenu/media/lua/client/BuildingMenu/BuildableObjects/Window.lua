local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Window = BaseBuildableObject:derive("Window");

function Window:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Window;
