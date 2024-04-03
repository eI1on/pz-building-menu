ISMicrowaveOven = ISBuildingObject:derive('ISMicrowaveOven')

function ISMicrowaveOven:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoStove.new(getCell(), self.sq, getSprite(sprite))
  self.javaObject:setMovedThumpable(true)
  self.javaObject:createContainersFromSpriteProperties()
  buildUtil.consumeMaterial(self);
  self.javaObject:sync();
  self.sq:AddSpecialObject(self.javaObject)
  self.javaObject:transmitCompleteItemToServer()
end

function ISMicrowaveOven:isValid(square)
  -- if not ISBuildingObject.isValid(self, square) then
  --   return false
  -- end
  return true
end

function ISMicrowaveOven:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISMicrowaveOven:new(player, name, sprite, northSprite)
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
  o.blockAllTheSquare = false;
  o.canBeAlwaysPlaced = false;
  o.maxTime = 250
  return o
end
