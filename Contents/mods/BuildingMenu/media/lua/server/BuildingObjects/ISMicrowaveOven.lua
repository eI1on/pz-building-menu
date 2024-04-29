---@class ISMicrowaveOven : ISBuildingObject
ISMicrowaveOven = ISBuildingObject:derive('ISMicrowaveOven')

--- Creates and places a microwave oven in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the oven is facing north
--- @param sprite string The sprite to use for the oven
function ISMicrowaveOven:create(x, y, z, north, sprite)
  local cell = getWorld():getCell();
  self.sq = cell:getGridSquare(x, y, z);

  self.javaObject = IsoStove.new(getCell(), self.sq, getSprite(sprite));
  self.javaObject:setMovedThumpable(true);
  self.javaObject:createContainersFromSpriteProperties();

  buildUtil.consumeMaterial(self);

  self.javaObject:sync();
  self.sq:AddSpecialObject(self.javaObject);
  self.javaObject:transmitCompleteItemToServer();
end

--- Validates if the microwave oven can be placed on the specified square
--- @param square IsoGridSquare The square to validate for placement
--- @return boolean Returns true if the oven can be placed, otherwise false
function ISMicrowaveOven:isValid(square)
  return true;
end

--- Renders a ghost tile of the microwave oven for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the oven will be placed
function ISMicrowaveOven:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for a new microwave oven instance
--- @param playerNum integer The player index who is building the oven
--- @param name string The name of the microwave oven
--- @param sprite string Main sprite for the oven
--- @param northSprite string North-facing sprite
--- @return ISMicrowaveOven ISBuildingObject instance
function ISMicrowaveOven:new(playerNum, name, sprite, northSprite)
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
  o.blockAllTheSquare = false;
  o.canBeAlwaysPlaced = false;
  o.maxTime = 250;
  return o;
end
