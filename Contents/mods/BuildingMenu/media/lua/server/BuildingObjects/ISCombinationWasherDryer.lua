--- @class ISCombinationWasherDryer : ISBuildingObject
ISCombinationWasherDryer = ISBuildingObject:derive('ISCombinationWasherDryer');

--- Creates a new combination washer-dryer object at a given position
--- @param x integer The x coordinate of the washer-dryer
--- @param y integer The y coordinate of the washer-dryer
--- @param z integer The z coordinate of the washer-dryer
--- @param north boolean The orientation of the washer-dryer
--- @param sprite string The sprite used to visually represent the washer-dryer
function ISCombinationWasherDryer:create(x, y, z, north, sprite)
  local cell = getWorld():getCell();
  self.sq = cell:getGridSquare(x, y, z);

  self.javaObject = IsoCombinationWasherDryer.new(getCell(), self.sq, getSprite(sprite));
  self.javaObject:createContainersFromSpriteProperties();
  self.javaObject:setMovedThumpable(true);

  buildUtil.consumeMaterial(self);

  self.sq:AddSpecialObject(self.javaObject);
  self.javaObject:transmitCompleteItemToServer();
end;

--- Checks if the placement of the washer-dryer is valid on the given square
--- @param square IsoGridSquare The square where the washer-dryer is to be placed
--- @return boolean validity True if the washer-dryer can be placed, false otherwise
function ISCombinationWasherDryer:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false;
  end;
  return true;
end;

--- Renders the combination washer-dryer object in the world
--- @param x integer The x coordinate to render
--- @param y integer The y coordinate to render
--- @param z integer The z coordinate to render
--- @param square IsoGridSquare The square associated with the object
function ISCombinationWasherDryer:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end;

--- Initializes a new instance of ISCombinationWasherDryer
--- @param playerNum integer The player index building the washer-dryer
--- @param name string The name of the washer-dryer
--- @param sprite string The primary sprite for the object
--- @param northSprite string The sprite for the object when facing north
--- @return ISCombinationWasherDryer ISBuildingObject instance
function ISCombinationWasherDryer:new(playerNum, name, sprite, northSprite)
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
