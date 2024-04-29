---@class ISGenerator : ISBuildingObject
ISGenerator = ISBuildingObject:derive('ISGenerator')

--- Creates and initializes a generator in the game world at the specified location
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Whether the generator is facing north (not used here but part of standard parameters)
--- @param sprite string The sprite to use for this object (not used here but part of standard parameters)
function ISGenerator:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoGenerator.new(nil, cell, self.sq);

    -- local player = getSpecificPlayer(self.player or 0);
    -- local electricalSkill = player:getPerkLevel(Perks.Electricity);
    -- local metalworkingSkill = player:getPerkLevel(Perks.MetalWelding);

    -- local condition = 20 + (electricalSkill / 7 * 60) + (metalworkingSkill / 6 * 40);
    -- condition = math.min(100, math.max(20, math.floor(condition)));

    -- self.javaObject:setCondition(condition);
    self.javaObject:setCondition(10);

    buildUtil.consumeMaterial(self);
end

--- Validates if the generator can be placed at the given square
--- @param square IsoGridSquare The square to check for placement validity
--- @return boolean validity Returns true if the generator can be placed, otherwise false
function ISGenerator:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false;
    end
    return true;
end

--- Renders a ghost tile of the generator for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the generator will be placed
function ISGenerator:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for creating a new instance of ISGenerator
--- @param sprite string The sprite for the main body of the generator
--- @param northSprite string The sprite when the generator is facing north
--- @return ISGenerator ISBuildingObject instance
function ISGenerator:new(sprite, northSprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);

    o.name = 'Generator';
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.canBeAlwaysPlaced = true;
    o.maxTime = 500;

    return o
end
