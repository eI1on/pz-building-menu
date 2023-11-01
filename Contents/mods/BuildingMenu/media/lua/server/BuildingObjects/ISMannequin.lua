ISMannequin = ISBuildingObject:derive('ISMannequin')

function ISMannequin:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoMannequin.new(getCell(), self.sq, getSprite(sprite))
  self.javaObject:setMovedThumpable(true)

	-- local _mannequinInv = ItemContainer.new()
  -- _mannequinInv:setType('mannequin')
  -- _mannequinInv:setCapacity(50)
	-- _mannequinInv:removeAllItems()
  -- _mannequinInv:setParent(self.javaObject)
  -- self.javaObject:setContainer(_mannequinInv)

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
  o.name = name
  o.stopOnWalk = false
  o.stopOnRun = false
  o.blockAllTheSquare = false;
	o.canBeAlwaysPlaced = true;
  o.maxTime = 800
  return o
end