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

    local player = getSpecificPlayer(self.player or 0);
    local electricalSkill = player:getPerkLevel(Perks.Electricity);
    local metalworkingSkill = player:getPerkLevel(Perks.MetalWelding);
    local condition = 20 + (electricalSkill / 6 * 60) + (metalworkingSkill / 4 * 40);
    condition = math.min(100, math.max(20, math.floor(condition)));

    self.javaObject:setCondition(condition);

    buildUtil.consumeMaterial(self);

    self.javaObject:transmitCompleteItemToServer();
end

--- Validates if the generator can be placed at the given square
--- @param square IsoGridSquare The square to check for placement validity
--- @return boolean validity Returns true if the generator can be placed, otherwise false
function ISGenerator:isValid(square)
    if not square then return false; end
    if not ISBuildingObject.isValid(self, square) then return false; end

    local checkSquare = square;
    if self.east then
        checkSquare = getCell():getGridSquare(square:getX() + 1, square:getY(), square:getZ());
    elseif self.south then
        checkSquare = getCell():getGridSquare(square:getX(), square:getY() + 1, square:getZ());
    end
    if not checkSquare then return false; end

    if self.needToBeAgainstWall then
        for i = 0, checkSquare:getObjects():size() - 1 do
            local obj = checkSquare:getObjects():get(i)
            if ((self.north or self.south) and (obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW"))) or
                ((self.west or self.east) and (obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW"))) then
                return true;
            end
        end
        return false;
    end

    local sharedSprite = getSprite(self:getSprite());
    if square and sharedSprite and sharedSprite:getProperties():Is("IsMoveAble") then
        local props = ISMoveableSpriteProps.new(sharedSprite);
        return props:canPlaceMoveable("bogus", square, nil);
    end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
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
    o.canBeAlwaysPlaced = false;
    o.maxTime = 500;

    return o
end
