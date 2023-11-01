ISScarecrow = ISBuildingObject:derive('ISScarecrow')

function ISScarecrow:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoMannequin.new(getCell(), self.sq, getSprite(sprite))
  self.javaObject:setMannequinScriptName(self.script:getName())
  self.javaObject:setMovedThumpable(true)
  self.javaObject:createContainersFromSpriteProperties()

	for i=1,self.javaObject:getContainerCount() do
		self.javaObject:getContainerByIndex(i-1):setExplored(true)
	end

  buildUtil.consumeMaterial(self);
  self.sq:AddSpecialObject(self.javaObject)
  self.javaObject:transmitCompleteItemToServer()
end

function ISScarecrow:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false
  end
  return true
end

function ISScarecrow:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISScarecrow:new(player, sprite)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  o:setSprite(sprite)
  o.canBarricade = false;
  o.player = player
  o.dismantable = true
  o.name = name
  o.script = getScriptManager():getMannequinScript("Base.MannequinScarecrow01");
  o.stopOnWalk = false
  o.stopOnRun = false
  o.blockAllTheSquare = false;
	o.canBeAlwaysPlaced = true;
  o.maxTime = 500
  return o
end