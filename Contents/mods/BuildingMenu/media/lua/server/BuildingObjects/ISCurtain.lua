--- @class ISCurtain : ISBuildingObject
ISCurtain = ISBuildingObject:derive('ISCurtain');

--- Creates a new curtain object at a given position
--- @param x integer The x coordinate of the curtain
--- @param y integer The y coordinate of the curtain
--- @param z integer The z coordinate of the curtain
--- @param north boolean The orientation of the curtain
--- @param sprite string The sprite used to visually represent the curtain
function ISCurtain:create(x, y, z, north, sprite)
  local cell        = getWorld():getCell();
  self.sq           = cell:getGridSquare(x, y, z);

  local north       = self.facing and (self.facing == "N" or self.facing == "S");
  local insertIndex = self.sq:getObjects() and self.sq:getObjects():size();

  self.javaObject   = IsoCurtain.new(cell, self.sq, sprite, north);
  if self.facing == "S" or self.facing == "E" then
    local wallFrame = ISMoveableSpriteProps:getWallForFacing(self.sq, north and "S" or "E", "WindowFrame");
    local window    = self.sq:getWindow(north);

    local objects   = self.sq:getObjects();
    for i = 0, objects:size() - 1 do
      local object = objects:get(i);

      if (window and object == window) or (wallFrame and object == wallFrame) then
        insertIndex = i + 1;
      end
    end
  end

  if self.sq:getObjects() and insertIndex > self.sq:getObjects():size() then
    insertIndex = self.sq:getObjects():size();
  end

  if self.javaObject then
    self.sq:AddSpecialObject(self.javaObject, insertIndex);
    if isClient() then self.javaObject:transmitCompleteItemToServer(); end
    triggerEvent("OnObjectAdded", self.javaObject);
  end

  self.sq:RecalcProperties();
  self.sq:RecalcAllWithNeighbours(true);

  buildUtil.consumeMaterial(self);
end;

--- Checks if the placement of the curtain is valid on the given square
--- @param square IsoGridSquare The square where the curtain is to be placed
--- @return boolean validity True if the curtain can be placed, false otherwise
function ISCurtain:isValid(square)
  if not square then return false; end
  if not self:haveMaterial(square) then return false; end

  if self.north then self.facing = "S"; end
  if self.south then self.facing = "N"; end
  if self.west then self.facing = "E"; end
  if self.east then self.facing = "W"; end

  local canPlace = true;
  canPlace = ISMoveableSpriteProps:getWallForFacing(square, self.facing, "WindowFrame");
  if canPlace then
    if square:Is(IsoFlagType.exterior) or (getSpecificPlayer(self.player):getSquare() and getSpecificPlayer(self.player):getSquare():Is(IsoFlagType.exterior)) then
      canPlace = false;
    end
  end
  if canPlace then
    for i = 0, square:getObjects():size() - 1 do
      local obj = square:getObjects():get(i);
      local sprite = obj:getSprite();
      if sprite and sprite:getProperties() then
        local props = sprite:getProperties();
        if props then
          if props:Is("MoveType") and props:Val("MoveType") == "WindowObject" then
            if props:Is("Facing") and props:Val("Facing") == self.facing then
              canPlace = false;
              break;
            end
          end
        end
      end
      if instanceof(obj, "IsoCurtain") then
        if self.facing == "S" and obj:getType() == IsoObjectType.curtainN then
          canPlace = false;
          break;
        end
        if self.facing == "N" and obj:getType() == IsoObjectType.curtainS then
          canPlace = false;
          break;
        end
        if self.facing == "E" and obj:getType() == IsoObjectType.curtainW then
          canPlace = false;
          break;
        end
        if self.facing == "W" and obj:getType() == IsoObjectType.curtainE then
          canPlace = false;
          break;
        end
      end
    end
  end

  local checkSquare = square;
  if self.east then
    checkSquare = getCell():getGridSquare(square:getX() + 1, square:getY(), square:getZ());
  elseif self.south then
    checkSquare = getCell():getGridSquare(square:getX(), square:getY() + 1, square:getZ());
  end
  if not checkSquare then canPlace = false; end

  if self.needToBeAgainstWall then
    for i = 0, checkSquare:getObjects():size() - 1 do
      local obj = checkSquare:getObjects():get(i)
      if ((self.north or self.south) and (obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW"))) or
          ((self.west or self.east) and (obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW"))) then
        return true;
      end
    end
    canPlace = false;
  end
  return canPlace;
end;

--- Renders a ghost tile of the curtain, delegates to the superclass
--- @param x integer The x coordinate to render
--- @param y integer The y coordinate to render
--- @param z integer The z coordinate to render
--- @param square IsoGridSquare The square associated with the object
function ISCurtain:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square);
end;

--- Initializes a new instance of ISCurtain
--- @param playerNum integer The player index building the curtain
--- @param name string The name of the curtain
--- @param sprite string The primary sprite for the object
--- @param northSprite string The sprite for the object when facing north
--- @return ISCurtain curtain The instance of the curtain object
function ISCurtain:new(playerNum, name, sprite, northSprite)
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
  o.canBeAlwaysPlaced = false;
  o.maxTime = 500;
  return o;
end;
