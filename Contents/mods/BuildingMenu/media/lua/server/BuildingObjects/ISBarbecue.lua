ISBarbecue = ISBuildingObject:derive('ISBarbecue')

function ISBarbecue:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    
    self.sq = cell:getGridSquare(x, y, z)
    self.javaObject = IsoBarbecue.new(getCell(), self.sq, getSprite(sprite))
    self.javaObject:setMovedThumpable(true)
    -- self.javaObject:setFuelAmount(ZombRand(0,100));
    -- self.javaObject:setLit(false)
    self.sq:AddSpecialObject(self.javaObject)

    buildUtil.consumeMaterial(self)

    self.javaObject:transmitCompleteItemToServer()
end

function ISBarbecue:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false
    end

    return true
end

function ISBarbecue:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
end

function ISBarbecue:new(player, name, sprite, northSprite)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o:init()
    o:setSprite(sprite)
    o:setNorthSprite(northSprite)

    o.player = player
    o.dismantable = true
    o.name = name
    o.stopOnWalk = true
    o.stopOnRun = true
    o.maxTime = 500
    
    return o
end
