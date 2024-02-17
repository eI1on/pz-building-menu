ISFourTileGarageDoor = ISBuildingObject:derive('ISFourTileGarageDoor')

--************************************************************************--
--** ISFourTileGarageDoor:new
--**
--************************************************************************--
function ISFourTileGarageDoor:new(sprite, sprite2, sprite3, sprite4, northSprite, northSprite2, northSprite3, northSprite4)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o:init()
    o:setSprite(sprite)

    o.sprite2 = sprite2
    o.sprite3 = sprite3
    o.sprite4 = sprite4

    o.northSprite = northSprite
    o.northSprite2 = northSprite2
    o.northSprite3 = northSprite3
    o.northSprite4 = northSprite4
    
    o.consumedItems = {}
	o.isDoor = true;
    o.isWallLike = true;
    o.thumpDmg = 5
    o.name = 'Big Garage Door'

    return o
end

function ISFourTileGarageDoor:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    local square = cell:getGridSquare(x, y, z)
    local xa, ya = self:getSquare2Pos(square, north)
    local xb, yb = self:getSquare3Pos(square, north)
    local xc, yc = self:getSquare4Pos(square, north)
    local spriteAName = self.sprite2
    local spriteBName = self.sprite3
    local spriteCName = self.sprite4
  
    if self.north then
      spriteAName = self.northSprite2
      spriteBName = self.northSprite3
      spriteCName = self.northSprite4
    end

    self:addDoorPart(x, y, z, north, sprite, 1)
    self:addDoorPart(xa, ya, z, north, spriteAName, 2)
    self:addDoorPart(xb, yb, z, north, spriteBName, 3)
    self:addDoorPart(xc, yc, z, north, spriteCName, 4)
end

function ISFourTileGarageDoor:addDoorPart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell()
    self.sq = cell:getGridSquare(x, y, z)

    if self:partExists(self.sq, index) then return; end

    self.javaObject = IsoDoor.new(cell, self.sq, sprite, north)
    self:overrideModData(index);
	self.javaObject:setHealth(self:getHealth());

    if index == 1 then
        self.consumedItems = buildUtil.consumeMaterial(self)
    end
  
    for _, item in ipairs(self.consumedItems) do
      if item:getType() == 'Doorknob' and item:getKeyId() ~= -1 then
        self.javaObject:setKeyId(item:getKeyId())
      end
    end

	self.sq:AddSpecialObject(self.javaObject);
	self.javaObject:transmitCompleteItemToServer();
end

function ISFourTileGarageDoor:getHealth()
    return 700 + buildUtil.getWoodHealth(self);
end

function ISFourTileGarageDoor:isValid(square)
    if not self:haveMaterial(square) then
        return false
    end
    if not square:hasFloor(self.north) then
        return false
    end
    if not self:partExists(square, 1) and not square:isFreeOrMidair(false) then
        return false
    end
    if square:isVehicleIntersecting() then
        return false
    end

    local xa, ya = self:getSquare2Pos(square, self.north)
    local xb, yb = self:getSquare3Pos(square, self.north)
    local xc, yc = self:getSquare4Pos(square, self.north)
    local squareA = getCell():getGridSquare(xa, ya, square:getZ())
    local squareB = getCell():getGridSquare(xb, yb, square:getZ())
    local squareC = getCell():getGridSquare(xc, yc, square:getZ())

    if (not squareA) or (not squareB) or (not squareC) then
        return false
    end

    local existsA = self:partExists(squareA, 2)
    local existsB = self:partExists(squareB, 3)
    local existsC = self:partExists(squareC, 4)

    if not existsA and not buildUtil.canBePlace(self, squareA) then
        return false
    end
    if not existsB and not buildUtil.canBePlace(self, squareB) then
        return false
    end
    if not existsC and not buildUtil.canBePlace(self, squareC) then
        return false
    end

    if squareA:isSomethingTo(square) then
        return false
    end
    if squareB:isSomethingTo(squareA) then
        return false
    end
    if squareC:isSomethingTo(squareB) then
        return false
    end

    if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
        return false
    end
    if buildUtil.stairIsBlockingPlacement(squareA, true, self.north) then
        return false
    end
    if buildUtil.stairIsBlockingPlacement(squareB, true, self.north) then
        return false
    end
    if buildUtil.stairIsBlockingPlacement(squareC, true, self.north) then
        return false
    end

    return true
end

function ISFourTileGarageDoor:render(x, y, z, square)
    local spriteName
    if not self:partExists(square, 1) then
        spriteName = self:getSprite()
        local sprite = IsoSprite.new()
        sprite:LoadFramesNoDirPageSimple(spriteName)
    
        local spriteFree = ISBuildingObject.isValid(self, square)
        if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
          spriteFree = false
        end
        if spriteFree then
          sprite:RenderGhostTile(x, y, z)
        else
          sprite:RenderGhostTileRed(x, y, z)
        end
    end

    local spriteAName = self.sprite2
    local spriteBName = self.sprite3
    local spriteCName = self.sprite4

    local spriteAFree = true
    local spriteBFree = true
    local spriteCFree = true

    local xa, ya = self:getSquare2Pos(square, self.north)
    local xb, yb = self:getSquare3Pos(square, self.north)
    local xc, yc = self:getSquare4Pos(square, self.north)


    if self.north then
        spriteName = self.northSprite
        spriteAName = self.northSprite2
        spriteBName = self.northSprite3
        spriteCName = self.northSprite4
    end

    local squareA = getCell():getGridSquare(xa, ya, z)
    if squareA == nil and getWorld():isValidSquare(xa, ya, z) then
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, z)
        getCell():ConnectNewSquare(squareA, false)
    end

    local squareB = getCell():getGridSquare(xb, yb, z)
    if squareB == nil and getWorld():isValidSquare(xb, yb, z) then
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, z)
        getCell():ConnectNewSquare(squareB, false)
    end

    local squareC = getCell():getGridSquare(xc, yc, z)
    if squareC == nil and getWorld():isValidSquare(xc, yc, z) then
        squareC = IsoGridSquare.new(getCell(), nil, xc, yc, z)
        getCell():ConnectNewSquare(squareC, false)
    end

    local existsA = self:partExists(squareA, 2)
    local existsB = self:partExists(squareB, 3)
    local existsC = self:partExists(squareC, 4)

    if not existsA and not buildUtil.canBePlace(self, squareA) then
        spriteAFree = false
    end
    if not existsB and not buildUtil.canBePlace(self, squareB) then
        spriteBFree = false
    end
    if not existsC and not buildUtil.canBePlace(self, squareC) then
        spriteCFree = false
    end

    if squareA and (squareA:isSomethingTo(square) or buildUtil.stairIsBlockingPlacement(squareA, true, self.north)) then
        spriteAFree = false
    end
    if squareB and (squareB:isSomethingTo(squareA) or buildUtil.stairIsBlockingPlacement(squareB, true, self.north)) then
        spriteBFree = false
    end
    if squareC and (squareC:isSomethingTo(squareB) or buildUtil.stairIsBlockingPlacement(squareC, true, self.north)) then
        spriteCFree = false
    end

    if not existsA then
        local spriteA = IsoSprite.new()
        spriteA:LoadFramesNoDirPageSimple(spriteAName)
        if spriteAFree then
            spriteA:RenderGhostTile(xa, ya, z)
        else
            spriteA:RenderGhostTileRed(xa, ya, z)
        end
    end
    if not existsB then
        local spriteB = IsoSprite.new()
        spriteB:LoadFramesNoDirPageSimple(spriteBName)
        if spriteBFree then
            spriteB:RenderGhostTile(xb, yb, z)
        else
            spriteB:RenderGhostTileRed(xb, yb, z)
        end
    end
    if not existsC then
        local spriteC = IsoSprite.new()
        spriteC:LoadFramesNoDirPageSimple(spriteCName)
        if spriteCFree then
            spriteC:RenderGhostTile(xc, yc, z)
        else
            spriteC:RenderGhostTileRed(xc, yc, z)
        end
    end
end


function ISFourTileGarageDoor:overrideModData(spriteIndex)
	local modData = self.javaObject:getModData();
	local modData2 = copyTable(modData);
	for k,v in pairs(modData2) do
		if luautils.stringStarts(k, "need:") then
			local itemFullType = luautils.split(k, ":")[2];
			local count = tonumber(v);
			if itemFullType == "Base.Doorknob" then
				if spriteIndex == 2 or spriteIndex == 3 then
					modData[k] = "1";
				else
					modData[k] = nil;
				end
			elseif itemFullType == "Base.Hinge" then
				if spriteIndex == 1 or spriteIndex == 4 then
					modData[k] = tostring(math.floor(count / 2 + 0.01));
				else
					modData[k] = nil;
				end
			else
				local count2 = math.floor(count / 4 + 0.01);
				if (count % 4 ~= 0) and (spriteIndex <= count % 4) then
					count2 = count2 + 1;
				end
				if count2 == 0 then
					modData[k] = nil;
				else
					modData[k] = tostring(count2);
				end
			end
		end
	end
end


function ISFourTileGarageDoor:getSquare2Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
      x = x + 1
    else
      y = y - 1
    end
    return x, y, z
end

function ISFourTileGarageDoor:getSquare3Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
      x = x + 2
    else
      y = y - 2
    end
    return x, y, z
end

function ISFourTileGarageDoor:getSquare4Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
      x = x + 3
    else
      y = y - 3
    end
    return x, y, z
end

function ISFourTileGarageDoor:partExists(square, index)
    local spriteName = self.north and self["northSprite" .. index] or self["sprite" .. index]
    local objects = square:getSpecialObjects()

    for i = 1, objects:size() do
      local object = objects:get(i - 1)
      if IsoDoor.getGarageDoorIndex(object) == index and object:getNorth() == self.north and not object:IsOpen() and object:getSprite():getName() == spriteName then
        return true
      end
    end
    return false
end