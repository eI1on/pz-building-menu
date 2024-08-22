local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local MetalDrum = BaseBuildableObject:derive("MetalDrum");

function MetalDrum:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return MetalDrum;
