ISSink = ISBuildingObject:derive('ISSink')

function ISSink:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoObject.new(getCell(), self.sq, getSprite(sprite))
  buildUtil.consumeMaterial(self)
  self.sq:AddSpecialObject(self.javaObject)
  self.javaObject:transmitCompleteItemToServer()
end

function ISSink:isValid(square)
  if not self:haveMaterial(square) then
    return false
  end
  if square:isVehicleIntersecting() then
    return false
  end

  local sharedSprite = getSprite(self:getSprite())
  if sharedSprite then
    local props = ISMoveableSpriteProps.new(sharedSprite)
    return props:canPlaceMoveable('bogus', square, nil)
  end
end

function ISSink:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISSink:new(player, name, sprite, northSprite)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  o:setSprite(sprite)
  o:setNorthSprite(northSprite)
  o.player = player;
  o.name = name;
  o.canBarricade = false;
  o.stopOnWalk = false;
  o.stopOnRun = false;
  o.maxTime = 150;
  return o
end
