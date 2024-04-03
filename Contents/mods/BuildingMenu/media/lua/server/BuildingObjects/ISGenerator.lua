ISGenerator = ISBuildingObject:derive('ISGenerator')


function ISGenerator:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()

    self.sq = cell:getGridSquare(x, y, z)
    self.javaObject = IsoGenerator.new(nil, getCell(), self.sq)
    self.javaObject:setCondition(10)

    buildUtil.consumeMaterial(self)
end

function ISGenerator:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false
    end

    return true
end

function ISGenerator:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
end

function ISGenerator:new(sprite, northSprite, perk)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o:init()
    o:setSprite(sprite)
    o:setNorthSprite(northSprite)

    o.name = 'Generator'
    o.stopOnWalk = true
    o.stopOnRun = true
    o.canBeAlwaysPlaced = true
    o.maxTime = 500

    return o
end
