local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Barbecue = BaseBuildableObject:derive("Barbecue");

function Barbecue:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Barbecue;
