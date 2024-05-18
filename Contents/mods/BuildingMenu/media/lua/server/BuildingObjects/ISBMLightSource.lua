ISBMLightSource = ISBuildingObject:derive("ISBMLightSource");

function ISBMLightSource:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoLightSwitch.new(cell, self.sq, getSprite(sprite), self.sq:getRoomID());
    self.javaObject:getModData()['IsLighting'] = true;
    self.javaObject:addLightSourceFromSprite();
    self.javaObject:setPower(2);
    self.javaObject:update();

    local offsetX = 0;
    local offsetY = 0;
    if self.east then
        offsetX = self.offsetX;
    elseif self.west then
        offsetX = -self.offsetX;
    elseif self.south then
        offsetY = self.offsetY;
    elseif self.north then
        offsetY = -self.offsetY;
    end

    local lights = self.javaObject:getLights();
    if lights and lights:size() > 0 then
        local fakeLight = lights:get(0);
        fakeLight:setX(fakeLight:getX() + offsetX);
        fakeLight:setY(fakeLight:getY() + offsetY);
        fakeLight:setR(1);
        fakeLight:setG(1);
        fakeLight:setB(1);
        local insertIndex = self.sq:getObjects() and self.sq:getObjects():size();
        if insertIndex and insertIndex > 0 then
            local objects = self.sq:getObjects();
            for i = objects:size(), 1, -1 do
                if not instanceof(objects:get(i - 1), "IsoWorldInventoryObject") then
                    insertIndex = i;
                    break;
                end
            end
        end
    end

    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();

    triggerEvent("OnObjectAdded", self.javaObject);

    self.sq:RecalcProperties();
    self.sq:RecalcAllWithNeighbours(true);
end

function ISBMLightSource:new(sprite, northSprite, player)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.canBarricade = false;
    o.dismantable = true;
    o.character = player;
    o.name = "Light Source";
    o.blockAllTheSquare = true;
    return o;
end

function ISBMLightSource:getHealth()
    return 200 + buildUtil.getWoodHealth(self);
end

function ISBMLightSource:isValid(square)
    if not self:haveMaterial(square) then return false; end
    if self.needToBeAgainstWall then
        for i = 0, square:getObjects():size() - 1 do
            local obj = square:getObjects():get(i);
            if (self.north and obj:getProperties():Is("WallN")) or (not self.north and obj:getProperties():Is("WallW")) then
                return true;
            end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    end
    return true;
end

function ISBMLightSource:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end
