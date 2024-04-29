---@class ISStove: ISBuildingObject
ISStove = ISBuildingObject:derive('ISStove')

--- Creates and places a stove in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the stove is facing north
--- @param sprite string The sprite to use for the stove
function ISStove:create(x, y, z, north, sprite)
  local cell = getWorld():getCell();
  self.sq = cell:getGridSquare(x, y, z);

  self.javaObject = IsoFireplace.new(cell, self.sq, getSprite(sprite));
  self.javaObject:setMovedThumpable(true);
  self.sq:AddSpecialObject(self.javaObject);

  buildUtil.consumeMaterial(self);

  self.javaObject:transmitCompleteItemToServer();
  self.sq:RecalcProperties();
  self.sq:RecalcAllWithNeighbours(true);
end

--- Validates if the stove can be placed on the specified square
--- @param square IsoGridSquare The square to validate for placement
--- @return boolean validity Returns true if the stove can be placed, otherwise false
function ISStove:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false;
  end

  if self.needToBeAgainstWall then
    for i = 0, square:getObjects():size() - 1 do
      local obj = square:getObjects():get(i);
      if self:getSprite() == obj:getTextureName() then
        return false;
      end
      if (not self.north and obj:getProperties():Is('WallN')) or (self.northSprite and obj:getProperties():Is('WallW')) then
        return true;
      end
    end
    return false;
  else
    return not buildUtil.stairIsBlockingPlacement(square, true);
  end
end

--- Renders a ghost tile of the stove for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the stove will be placed
function ISStove:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for a new stove instance
--- @param playerNum integer The player index who is building the stove
--- @param name string The name of the stove
--- @param sprite string Main sprite for the stove
--- @param northSprite string North-facing sprite
--- @return ISStove ISBuildingObject instance
function ISStove:new(playerNum, name, sprite, northSprite)
  local o = setmetatable({}, { __index = self });
  o:init();
  o:setSprite(sprite);
  o:setNorthSprite(northSprite);
  o.player = playerNum;
  o.dismantable = true;
  o.needToBeAgainstWall = false;
  o.name = name;
  o.stopOnWalk = true;
  o.stopOnRun = true;
  o.maxTime = 500;
  return o;
end
