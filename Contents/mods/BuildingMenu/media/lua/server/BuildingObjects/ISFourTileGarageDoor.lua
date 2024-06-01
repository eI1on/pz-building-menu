local BM_Utils = require("BM_Utils")

--- @class ISFourTileGarageDoor : ISBuildingObject
ISFourTileGarageDoor = ISBuildingObject:derive('ISFourTileGarageDoor')


--- Initializes a new instance of the ISFourTileGarageDoor class
--- @param sprite string The primary sprite for the door
--- @param sprite2 string The second sprite
--- @param sprite3 string The third sprite
--- @param sprite4 string The fourth sprite
--- @param northSprite string North-facing variant of the primary sprite
--- @param northSprite2 string North-facing variant of the second sprite
--- @param northSprite3 string North-facing variant of the third sprite
--- @param northSprite4 string North-facing variant of the fourth sprite
--- @return ISFourTileGarageDoor ISBuildingObject instance
function ISFourTileGarageDoor:new(sprite, sprite2, sprite3, sprite4, northSprite, northSprite2, northSprite3,
                                  northSprite4)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);

    o.sprite2 = sprite2;
    o.sprite3 = sprite3;
    o.sprite4 = sprite4;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;
    o.northSprite3 = northSprite3;
    o.northSprite4 = northSprite4;

    o.consumedItems = {};
    o.isDoor = true;
    o.isWallLike = true;
    o.thumpDmg = 5;
    o.name = 'Big Garage Door';

    o.RENDER_SPRITE_CACHE = {};

    return o;
end


--- Creates the four parts of the garage door on the map
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Whether the door is facing north
function ISFourTileGarageDoor:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    local xa, ya = self:getSquare2Pos(self.sq, north);
    local xb, yb = self:getSquare3Pos(self.sq, north);
    local xc, yc = self:getSquare4Pos(self.sq, north);

    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;
    local spriteCName = self.sprite4;

    if self.north then
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
        spriteCName = self.northSprite4;
    end

    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, z, north, spriteAName, 2);
    self:createPart(xb, yb, z, north, spriteBName, 3);
    self:createPart(xc, yc, z, north, spriteCName, 4);
end


--- Adds a single part of the garage door to the specified location
--- @param x integer x coordinate where the part should be placed
--- @param y integer y coordinate where the part should be placed
--- @param z integer z coordinate (floor level)
--- @param north boolean Orientation of the part
--- @param sprite string The sprite for this part
--- @param index integer The index of the part (1-4)
function ISFourTileGarageDoor:createPart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell();
    local square = cell:getGridSquare(x, y, z);

    if self:partExists(square, index) then return; end

    self.javaObject = IsoDoor.new(cell, square, sprite, north);
    self:overrideModData(index);
    self.javaObject:setHealth(self:getHealth());

    if index == 1 then
        self.consumedItems = buildUtil.consumeMaterial(self);
    end

    for _, item in ipairs(self.consumedItems) do
        if item:getType() == 'Doorknob' and item:getKeyId() ~= -1 then
            self.javaObject:setKeyId(item:getKeyId());
        end
    end

    square:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end


--- Returns the health of the garage door based on material and construction
--- @return integer health The calculated health value
function ISFourTileGarageDoor:getHealth()
    if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 750 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	return 750 + buildUtil.getWoodHealth(self);
end


--- Checks if the specified square is a valid location for placing the garage door
--- @param square IsoGridSquare The square to check for validity
--- @return boolean validity True if valid, false otherwise
function ISFourTileGarageDoor:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    -- checks for additional squares (parts 2, 3, 4)
    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);
    local xc, yc = self:getSquare4Pos(square, self.north);

    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    local squareB = getCell():getGridSquare(xb, yb, square:getZ());
    local squareC = getCell():getGridSquare(xc, yc, square:getZ());

    if (not squareA) or (not squareB) or (not squareC) then return false; end

    if square:isSomethingTo(squareA) then return false; end
    if squareA:isSomethingTo(squareB) then return false; end
    if squareB:isSomethingTo(squareC) then return false; end

    -- check the primary square (part 1)
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) then
        return false;
    end
    -- check validity for additional squares
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) then
        return false;
    end
    if self:partExists(squareB, 3) or not self:checkSingleTileValidity(squareB) then
        return false;
    end
    if self:partExists(squareC, 4) or not self:checkSingleTileValidity(squareC) then
        return false;
    end
    -- if all checks passed, return true
    return true;
end


--- Renders a ghost tile of the garage door at the specified location for pre-placement visualization
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the garage door will be placed
function ISFourTileGarageDoor:render(x, y, z, square)
    local haveMaterials = self:haveMaterial(square);

    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;
    local spriteCName = self.sprite4;

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
        spriteCName = self.northSprite4;
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);
    local xc, yc, zc = self:getSquare4Pos(square, self.north);

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    if squareA == nil and getWorld():isValidSquare(xa, ya, za) then
---@diagnostic disable-next-line: param-type-mismatch
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, za);
        getCell():ConnectNewSquare(squareA, false);
    end

    local squareB = getCell():getGridSquare(xb, yb, zb)
    if squareB == nil and getWorld():isValidSquare(xb, yb, zb) then
---@diagnostic disable-next-line: param-type-mismatch
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, zb);
        getCell():ConnectNewSquare(squareB, false);
    end

    local squareC = getCell():getGridSquare(xc, yc, zc)
    if squareC == nil and getWorld():isValidSquare(xc, yc, zc) then
---@diagnostic disable-next-line: param-type-mismatch
        squareC = IsoGridSquare.new(getCell(), nil, xc, yc, zc);
        getCell():ConnectNewSquare(squareC, false);
    end

    -- initial checks for the primary square
    local spriteFree = true;
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) or not haveMaterials then
        spriteFree = false;
    end

    -- check validity for additional squares
    local spriteAFree = true;
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) or not haveMaterials then
        spriteAFree = false;
    end

    local spriteBFree = true;
    if self:partExists(squareB, 3) or not self:checkSingleTileValidity(squareB) or not haveMaterials then
        spriteBFree = false;
    end

    local spriteCFree = true;
    if self:partExists(squareC, 4) or not self:checkSingleTileValidity(squareC) or not haveMaterials then
        spriteCFree = false;
    end

    if square:isSomethingTo(squareA) then spriteFree = false; spriteAFree = false; end
    if squareA:isSomethingTo(squareB) then spriteAFree = false; spriteBFree = false; end
    if squareB:isSomethingTo(squareC) then spriteBFree = false; spriteCFree = false; end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z);
        self:renderFloorHelperTile(2, xa, ya, za);
        self:renderFloorHelperTile(3, xb, yb, zb);
        self:renderFloorHelperTile(4, xc, yc, zc);
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree);
    self:renderPart(spriteCName, xc, yc, zc, spriteCFree);
end


---Renders a ghost tile part of the furniture
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISFourTileGarageDoor:renderPart(spriteName, x, y, z, isFree)
    if not self.RENDER_SPRITE_CACHE[spriteName] then
        local sprite = IsoSprite.new();
        sprite:LoadFramesNoDirPageSimple(spriteName);
        self.RENDER_SPRITE_CACHE[spriteName] = sprite;
    end
    local sprite = self.RENDER_SPRITE_CACHE[spriteName];
    if isFree then
        sprite:RenderGhostTile(x, y, z);
    else
        sprite:RenderGhostTileRed(x, y, z);
    end
end


---Renders a floor helper tile
---@param index integer The index of the part to check for
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
function ISFourTileGarageDoor:renderFloorHelperTile(index, x, y, z)
    local helperSpriteName = 'carpentry_02_56';
    if not self.RENDER_SPRITE_FLOOR_CACHE then
        self.RENDER_SPRITE_FLOOR_CACHE = {};
    end
    if not self.RENDER_SPRITE_FLOOR_CACHE[index] then
        self.RENDER_SPRITE_FLOOR_CACHE[index] = IsoSprite.new();
        self.RENDER_SPRITE_FLOOR_CACHE[index]:LoadFramesNoDirPageSimple(helperSpriteName);
    end
    self.RENDER_SPRITE_FLOOR_CACHE[index]:RenderGhostTile(x, y, z);
end


---Checks if a single tile is valid for furniture placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISFourTileGarageDoor:checkSingleTileValidity(square)
    if not square then return false; end

    -- ISBuildingObject:isValid without the check for materials on square, we only check for the first part of the obj 
---@diagnostic disable-next-line: param-type-mismatch
    if self.notExterior and not square:Is(IsoFlagType.exterior) then return false; end
	if square:isVehicleIntersecting() then return false end
	if self.canBeAlwaysPlaced then
		-- even if we can place this item everywhere, we can't place 2 same objects on the same tile
		for i=0,square:getObjects():size()-1 do
			local obj = square:getObjects():get(i);
			if self:getSprite() == obj:getTextureName() then
				return false
			end
		end
		return true
	end
	local blockedByCharacters = self.isWallLike ~= true;
    if not square:isFreeOrMidair(blockedByCharacters) or not buildUtil.canBePlace(self, square) then return false; end

    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
        return false;
    end

    -- if all checks passed, return true
    return true;
end


--- Modifies the modData of the ISFourTileGarageDoor based on the part index to correctly set the material requirements for each part of the door
--- @param spriteIndex integer The index of the door part being processed
function ISFourTileGarageDoor:overrideModData(spriteIndex)
    local modData = self.javaObject:getModData();
    local modData2 = copyTable(modData);
    for k, v in pairs(modData2) do
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


--- Calculates the world coordinates for the second part of the garage door based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the door is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the second part
function ISFourTileGarageDoor:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 1;
    else
        y = y - 1;
    end
    return x, y, z;
end


--- Calculates the world coordinates for the third part of the garage door based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the door is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the third part
function ISFourTileGarageDoor:getSquare3Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 2;
    else
        y = y - 2;
    end
    return x, y, z;
end


--- Calculates the world coordinates for the fourth part of the garage door based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the door is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the fourth part
function ISFourTileGarageDoor:getSquare4Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 3;
    else
        y = y - 3;
    end
    return x, y, z;
end


--- Checks if a specific part of the garage door already exists at a given square
--- This is used to prevent duplicating parts on the same square and ensures each part is unique
--- @param square IsoGridSquare The square to check for existing parts
--- @param index integer|string|nil The index of the part to check (1-4)
--- @return boolean exists True if the part exists, false otherwise
function ISFourTileGarageDoor:partExists(square, index)
    local spriteName = self:getSpriteNameForPart(index, self.north);
    local objects = square:getSpecialObjects();
    for i = 0, objects:size() - 1 do
        local object = objects:get(i);
        if IsoDoor.getGarageDoorIndex(object) == index and object:getNorth() == self.north and not object:IsOpen() and object:getSprite():getName() == spriteName then
            return true;
        end
    end
    return false;
end


---Gets the sprite name for a part based on its index and orientation
---@param index integer|string|nil The index of the part
---@param north boolean The orientation of the part
---@return string spriteName The sprite name
function ISFourTileGarageDoor:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
