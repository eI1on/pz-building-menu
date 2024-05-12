ISWindowWallObj = ISBuildingObject:derive('ISWindowWallObj')

function ISWindowWallObj:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)

  self.javaObject = IsoWindow.new(getCell(), self.sq, getSprite(sprite), north)
  buildUtil.consumeMaterial(self)
  self.sq:AddSpecialObject(self.javaObject)
  self.javaObject:transmitCompleteItemToServer()
end

function ISWindowWallObj:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false
  end
  if buildUtil.stairIsBlockingPlacement(square, true) then
    return false
  end
  return true
end

function ISWindowWallObj:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISWindowWallObj:new(sprite, northSprite, player)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  o:setSprite(sprite)
  o:setNorthSprite(northSprite)
  o.player = player
  o.canBarricade = true
  o.dismantable = true
  o.name = name
  o.stopOnWalk = true
  o.stopOnRun = true
  o.maxTime = 150
  return o
end