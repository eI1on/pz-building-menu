local BM_Utils = require("BM_Utils")

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
	if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 350 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	return 350 + buildUtil.getWoodHealth(self);
end

function ISBMLightSource:isValid(square)
    if not self:haveMaterial(square) then return false; end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end

    local checkSquare = square;
    if self.east then
        checkSquare = getCell():getGridSquare(square:getX() + 1, square:getY(), square:getZ());
    elseif self.south then
        checkSquare = getCell():getGridSquare(square:getX(), square:getY() + 1, square:getZ());
    end
    if not checkSquare then return false; end

    if self.needToBeAgainstWall then
        for i = 0, checkSquare:getObjects():size() - 1 do
            local obj = checkSquare:getObjects():get(i)
            if ((self.north or self.south) and (obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW"))) or
               ((self.west or self.east) and (obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW"))) then
                return true;
            end
        end
        return false;
    end
    return true;
end

function ISBMLightSource:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end
