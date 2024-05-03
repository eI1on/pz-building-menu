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

    self.javaObject = IsoBarbecue.new(getCell(), self.sq, getSprite(sprite));
    self.javaObject:setMovedThumpable(true);

    self.sq:AddSpecialObject(self.javaObject);
    buildUtil.consumeMaterial(self);

    self.javaObject:transmitCompleteItemToServer();
end

--- Checks if the barbecue can be placed on the specified square
--- @param square IsoGridSquare The square to check for validity
--- @return boolean validity true if the square is valid, false otherwise
function ISBarbecue:isValid(square)
    if not square then return false; end
	if not ISBuildingObject.isValid(self, square) then return false; end
	if self.needToBeAgainstWall then
        for i=0,square:getObjects():size()-1 do
           local obj = square:getObjects():get(i);
           if (self.north and obj:getProperties():Is("WallN")) or (not self.north and obj:getProperties():Is("WallW")) then
               return true;
           end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    end
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
