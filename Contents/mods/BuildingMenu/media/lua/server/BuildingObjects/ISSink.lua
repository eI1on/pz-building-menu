---@class ISSink: ISBuildingObject
ISSink = ISBuildingObject:derive('ISSink')

--- Creates and places a sink in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the sink is facing north
--- @param sprite string The sprite to use for the sink
function ISSink:create(x, y, z, north, sprite)
  local cell = getWorld():getCell();
  self.sq = cell:getGridSquare(x, y, z);

  self.javaObject = IsoObject.new(cell, self.sq, getSprite(sprite));

  buildUtil.consumeMaterial(self);

  self.sq:AddSpecialObject(self.javaObject);
  self.javaObject:transmitCompleteItemToServer();
end

--- Validates if the sink can be placed on the specified square
--- @param square IsoGridSquare The square to validate for placement
--- @return boolean validity Returns true if the sink can be placed, otherwise false
function ISSink:isValid(square)
  if not self:haveMaterial(square) or square:isVehicleIntersecting() then
    return false;
  end

  local sharedSprite = getSprite(self:getSprite());
  if sharedSprite then
    local moveProps = ISMoveableSpriteProps.new(sharedSprite);
    return moveProps:canPlaceMoveable('bogus', square, nil);
  end
  return true;
end

--- Renders a ghost tile of the sink for placement preview
--- TODO: Snap the object to counter/table faces
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the sink will be placed
function ISSink:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for a new sink instance
--- @param playerNum integer The player index who is building the sink
--- @param name string The name of the sink
--- @param sprite string Main sprite for the sink
--- @param northSprite string North-facing sprite
--- @return ISSink ISBuildingObject instance
function ISSink:new(playerNum, name, sprite, northSprite)
  local o = setmetatable({}, { __index = self });
  o:init();
  o:setSprite(sprite);
  o:setNorthSprite(northSprite);
  o.player = playerNum;
  o.name = name;
  o.canBarricade = false;
  o.stopOnWalk = false;
  o.stopOnRun = false;
  o.maxTime = 150;
  return o;
end
