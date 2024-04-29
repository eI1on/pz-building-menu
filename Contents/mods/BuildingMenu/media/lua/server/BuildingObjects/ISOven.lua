---@class ISOven: ISBuildingObject
ISOven = ISBuildingObject:derive('ISOven')

--- Creates and places an oven in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the oven is facing north
--- @param sprite string The sprite to use for the oven
function ISOven:create(x, y, z, north, sprite)
  local cell = getWorld():getCell();
  self.sq = cell:getGridSquare(x, y, z);

  self.javaObject = IsoStove.new(cell, self.sq, getSprite(sprite));
  self.javaObject:setMovedThumpable(true);
  self.javaObject:createContainersFromSpriteProperties();

  buildUtil.consumeMaterial(self);

  self.javaObject:sync();
  self.sq:AddSpecialObject(self.javaObject);
  self.javaObject:transmitCompleteItemToServer();
end

--- Validates if the oven can be placed on the specified square
--- @param square IsoGridSquare The square to validate for placement
--- @return boolean Returns true if the oven can be placed, otherwise false
function ISOven:isValid(square)
  return ISBuildingObject.isValid(self, square);
end

--- Renders a ghost tile of the oven for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the oven will be placed
function ISOven:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for a new oven instance
--- @param playerNum integer The player index who is placing the oven
--- @param name string The name of the oven
--- @param sprite string Main sprite for the oven
--- @param northSprite string North-facing sprite
--- @return ISOven ISBuildingObject instance
function ISOven:new(playerNum, name, sprite, northSprite)
  local o = setmetatable({}, { __index = self });
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
end
