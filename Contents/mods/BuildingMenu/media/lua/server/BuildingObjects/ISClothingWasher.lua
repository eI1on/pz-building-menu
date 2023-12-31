ISClothingWasher = ISBuildingObject:derive('ISClothingWasher')

function ISClothingWasher:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoClothingWasher.new(getCell(), self.sq, getSprite(sprite))
  self.javaObject:setMovedThumpable(true)
  self.javaObject:createContainersFromSpriteProperties()
  buildUtil.consumeMaterial(self);
  self.sq:AddSpecialObject(self.javaObject)
  self.javaObject:transmitCompleteItemToServer()
end

function ISClothingWasher:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false
  end
  return true
end

function ISClothingWasher:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISClothingWasher:new(player, name, sprite, northSprite)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  o:setSprite(sprite)
  o:setNorthSprite(northSprite)
  o.canBarricade = false;
  o.player = player
  o.dismantable = true
  o.name = name
  o.stopOnWalk = true
  o.stopOnRun = true
  o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
  o.maxTime = 500
  return o
end