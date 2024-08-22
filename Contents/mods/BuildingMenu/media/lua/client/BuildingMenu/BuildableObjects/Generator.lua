local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Generator = BaseBuildableObject:derive("Generator");

function Generator:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Generator;
