--- @class ISBarbecue : ISBuildingObject
ISBarbecue = ISBuildingObject:derive('ISBarbecue')

--- Constructor for the ISBarbecue class
--- @param playerNum integer The player index creating the barbecue
--- @param name string The name of the object
--- @param sprite string The sprite for the barbecue when not facing north
--- @param northSprite string The sprite for the barbecue when facing north
--- @return ISBarbecue ISBuildingObject instance
function ISBarbecue:new(playerNum, name, sprite, northSprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);

    o.player = playerNum;
    o.dismantable = true;
    o.name = name;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = 500;

    return o;
end

--- Creates a barbecue at the specified location
--- @param x integer The x coordinate of the location
--- @param y integer The y coordinate of the location
--- @param z integer The z coordinate of the location
--- @param north boolean Whether the barbecue is facing north, or not
--- @param sprite string The sprite name for the barbecue
function ISBarbecue:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoBarbecue.new(cell, self.sq, getSprite(sprite));
    self.javaObject:setMovedThumpable(true);

    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

--- Checks if the barbecue can be placed on the specified square
--- @param square IsoGridSquare The square to check for validity
--- @return boolean validity true if the square is valid, false otherwise
function ISBarbecue:isValid(square)
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

--- Renders a ghost tile of the barbecue for placement preview
--- @param x integer The x coordinate of the location
--- @param y integer The y coordinate of the location
--- @param z integer The z coordinate of the location
--- @param square IsoGridSquare The square where the barbecue is to be rendered
function ISBarbecue:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end
