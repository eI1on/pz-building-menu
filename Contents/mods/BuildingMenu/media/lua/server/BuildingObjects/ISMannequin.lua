ISMannequin = ISBuildingObject:derive('ISMannequin')

function ISMannequin:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoMannequin.new(getCell(), self.sq, getSprite(sprite))

  if self.scriptStr then
    local mannequinScript = getScriptManager():getMannequinScript(self.scriptStr);
    self.javaObject:setMannequinScriptName(mannequinScript:getName())
  end

  self.javaObject:setMovedThumpable(true)

  self.javaObject:createContainersFromSpriteProperties()
	for i=1,self.javaObject:getContainerCount() do
		self.javaObject:getContainerByIndex(i-1):setExplored(true)
	end

  buildUtil.consumeMaterial(self);
  self.sq:AddSpecialObject(self.javaObject)
  self.javaObject:transmitCompleteItemToServer()
end

function ISMannequin:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false
  end
  return true
end

function ISMannequin:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISMannequin:new(player, sprite)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  o:setSprite(sprite)
  o.canBarricade = false;
  o.player = player
  o.dismantable = true
  o.name = "Mannequin";
  o.scriptStr = nil;
  o.stopOnWalk = false
  o.stopOnRun = false
  o.blockAllTheSquare = false;
	o.canBeAlwaysPlaced = true;
  o.maxTime = 800
  return o
end