ISWindowObj = ISBuildingObject:derive('ISWindowObj')

function ISWindowObj:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    self.sq = cell:getGridSquare(x, y, z)
    self.javaObject = IsoWindow.new(getCell(), self.sq, getSprite(sprite), north)
    buildUtil.consumeMaterial(self)
    self.sq:AddSpecialObject(self.javaObject)
    self.javaObject:setIsLocked(false)
    self.javaObject:transmitCompleteItemToServer()
end

function ISWindowObj:isValid(square)
    if not self:haveMaterial(square) then
        return false
    end
    if square:isVehicleIntersecting() then
        return false
    end

    if self:getSprite() == "fixtures_windows_01_72" or self:getSprite() == "fixtures_windows_01_73" then 
        for i=1,square:getObjects():size() do
            local object = square:getObjects():get(i-1);
            local sprite = object:getTextureName()
            if sprite and (luautils.stringStarts(sprite, "walls_interior_house_05_") or luautils.stringStarts(sprite, "walls_exterior_house_03_")) and object:getNorth() == self.north then
                return true;
            end
        end
        return false;
    end

    local sharedSprite = getSprite(self:getSprite())
    if sharedSprite then
        local props = ISMoveableSpriteProps.new(sharedSprite)
        return props:canPlaceMoveable('bogus', square, nil)
    end
end

function ISWindowObj:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
end

function ISWindowObj:new(sprite, northSprite, player)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o:init()
    o:setSprite(sprite)
    o:setNorthSprite(northSprite)
    o.player = player
    o.canBarricade = true
    o.stopOnWalk = true
    o.stopOnRun = true
    o.maxTime = 150
    return o
end
