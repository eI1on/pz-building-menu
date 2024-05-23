--- @class ISClothingDryer : ISBuildingObject
ISClothingDryer = ISBuildingObject:derive('ISClothingDryer');

--- Creates a new clothing dryer object at a given position
--- @param x integer The x coordinate of the dryer
--- @param y integer The y coordinate of the dryer
--- @param z integer The z coordinate of the dryer
--- @param north boolean The orientation of the dryer
--- @param sprite string The sprite used to visually represent the dryer
function ISClothingDryer:create(x, y, z, north, sprite)
  local cell = getWorld():getCell();
  self.sq = cell:getGridSquare(x, y, z);

  self.javaObject = IsoClothingDryer.new(cell, self.sq, getSprite(sprite));
  self.javaObject:setMovedThumpable(true);
  self.javaObject:createContainersFromSpriteProperties();

  buildUtil.consumeMaterial(self);

  self.sq:AddSpecialObject(self.javaObject);
  self.sq:RecalcAllWithNeighbours(true);
  self.javaObject:transmitCompleteItemToServer();
end;

--- Checks if the placement of the dryer is valid on the given square
--- @param square IsoGridSquare The square where the dryer is to be placed
--- @return boolean validity True if the dryer can be placed, false otherwise
function ISClothingDryer:isValid(square)
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
end;

--- Renders a ghost tile of the clothing dryer, delegates to the superclass
--- @param x integer The x coordinate to render
--- @param y integer The y coordinate to render
--- @param z integer The z coordinate to render
--- @param square IsoGridSquare The square associated with the object
function ISClothingDryer:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end;

--- Initializes a new instance of ISClothingDryer
--- @param playerNum integer The player index building the dryer
--- @param name string The name of the dryer
--- @param sprite string The primary sprite for the object
--- @param northSprite string The sprite for the object when facing north
--- @return ISClothingDryer dryer The instance of the dryer object
function ISClothingDryer:new(playerNum, name, sprite, northSprite)
  local o = {};
  setmetatable(o, self);
  self.__index = self;
  o:init();
  o:setSprite(sprite);
  o:setNorthSprite(northSprite);
  o.canBarricade = false;
  o.player = playerNum;
  o.dismantable = true;
  o.name = name;
  o.stopOnWalk = true;
  o.stopOnRun = true;
  o.blockAllTheSquare = true;
  o.canBeAlwaysPlaced = true;
  o.maxTime = 500;
  return o;
end;
