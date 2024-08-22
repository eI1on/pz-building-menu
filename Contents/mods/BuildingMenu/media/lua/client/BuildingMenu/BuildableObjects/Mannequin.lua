local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Mannequin = BaseBuildableObject:derive("Mannequin");

function Mannequin:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Mannequin;
