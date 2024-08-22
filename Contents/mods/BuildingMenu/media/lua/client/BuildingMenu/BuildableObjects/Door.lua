local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject");

local Door = BaseBuildableObject:derive("Door");

function Door:new(params)
    local o = BaseBuildableObject.new(self, params);
    setmetatable(o, self);
    self.__index = self;

    return o;
end

return Door;
