local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local CombiantionWasherDryer = BaseBuildableObject:derive("CombiantionWasherDryer");

function CombiantionWasherDryer:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return CombiantionWasherDryer;
