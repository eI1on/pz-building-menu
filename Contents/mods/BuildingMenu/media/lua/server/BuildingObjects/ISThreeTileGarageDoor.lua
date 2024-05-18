local BM_Utils = require("BM_Utils")

---@class ISThreeTileGarageDoor: ISBuildingObject
ISThreeTileGarageDoor = ISBuildingObject:derive("ISThreeTileGarageDoor")

--- Constructor for creating a new three-tile garage door instance
--- @param sprite string Main sprite for the garage door
--- @param sprite2 string Sprite for the second tile
--- @param sprite3 string Sprite for the third tile
--- @param northSprite string North-facing sprite for the main tile
--- @param northSprite2 string North-facing sprite for the second tile
--- @param northSprite3 string North-facing sprite for the third tile
--- @return ISThreeTileGarageDoor ISBuildingObject instance
function ISThreeTileGarageDoor:new(sprite, sprite2, sprite3, northSprite, northSprite2, northSprite3)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);

    o.sprite2 = sprite2;
    o.sprite3 = sprite3;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;
    o.northSprite3 = northSprite3;

    o.consumedItems = {};
    o.isDoor = true;
    o.isWallLike = true;
    o.thumpDmg = 5;
    o.name = "Garage Door";

    o.RENDER_SPRITE_CACHE = {};

    return o;
end

--- Creates and adds parts of the garage door to the game world
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the door is facing north
--- @param sprite string The sprite to use for the main part of the door
function ISThreeTileGarageDoor:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    local xa, ya = self:getSquare2Pos(self.sq, north);
    local xb, yb = self:getSquare3Pos(self.sq, north);

    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;

    if self.north then
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
    end

    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, z, north, spriteAName, 2);
    self:createPart(xb, yb, z, north, spriteBName, 3);
end

--- Adds a single part of the garage door to the specified location
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the door is facing north
--- @param sprite string The sprite for this door part
--- @param index number The index of the door part (1, 2, or 3)
function ISThreeTileGarageDoor:createPart(x, y, z, north, sprite, index)
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
        if item:getType() == "Doorknob" and item:getKeyId() ~= -1 then
            self.javaObject:setKeyId(item:getKeyId());
        end
    end

    square:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

--- Returns the health of the garage door based on construction parameters
--- @return number health The health value of the door
function ISThreeTileGarageDoor:getHealth()
    if self.usedTools then
        for i, tool in ipairs(self.usedTools) do
            local toolType = tool.toolType;
            if toolType == "BlowTorch" then
                return 600 + BM_Utils.getMetalHealth(self);
            end
        end
    end
    return 600 + buildUtil.getWoodHealth(self);
end

--- Validates if the garage door can be placed on the specified square
--- @param square IsoGridSquare The square to validate for placement
--- @return boolean validity Returns true if the door can be placed, otherwise false
function ISThreeTileGarageDoor:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    -- checks for additional squares (parts 2, 3)
    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);

    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    local squareB = getCell():getGridSquare(xb, yb, square:getZ());

    if (not squareA) or (not squareB) then return false; end

    if square:isSomethingTo(squareA) then return false; end
    if squareA:isSomethingTo(squareB) then return false; end

    -- check the primary square (part 1)
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) or not self:haveMaterial(square) then
        return false;
    end
    -- check validity for additional squares
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) then
        return false;
    end
    if self:partExists(squareB, 3) or not self:checkSingleTileValidity(squareB) then
        return false;
    end
    -- if all checks passed, return true
    return true;
end

--- Renders a ghost tile of the garage door for placement preview
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param square IsoGridSquare The square where the garage door will be placed
function ISThreeTileGarageDoor:render(x, y, z, square)
    local haveMaterials = self:haveMaterial(square);

    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    if squareA == nil and getWorld():isValidSquare(xa, ya, za) then
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, za);
        getCell():ConnectNewSquare(squareA, false);
    end

    local squareB = getCell():getGridSquare(xb, yb, zb)
    if squareB == nil and getWorld():isValidSquare(xb, yb, zb) then
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, zb);
        getCell():ConnectNewSquare(squareB, false);
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

    if square:isSomethingTo(squareA) then
        spriteFree = false; spriteAFree = false;
    end
    if squareA:isSomethingTo(squareB) then
        spriteAFree = false; spriteBFree = false;
    end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z);
        self:renderFloorHelperTile(2, xa, ya, za);
        self:renderFloorHelperTile(3, xb, yb, zb);
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree);
end

---Checks if a single tile is valid for the garage door placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISThreeTileGarageDoor:checkSingleTileValidity(square)
    if not square then return false; end

    -- ISBuildingObject:isValid without the check for materials on square, we only check for the first part of the obj
    if self.notExterior and not square:Is(IsoFlagType.exterior) then return false end
    if square:isVehicleIntersecting() then return false end
    if self.canBeAlwaysPlaced then
        -- even if we can place this item everywhere, we can't place 2 same objects on the same tile
        for i = 0, square:getObjects():size() - 1 do
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

---Renders a ghost tile part of the furniture
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISThreeTileGarageDoor:renderPart(spriteName, x, y, z, isFree)
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
function ISThreeTileGarageDoor:renderFloorHelperTile(index, x, y, z)
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

--- Modifies the modData of the ISThreeTileGarageDoor based on the part index to correctly set the material requirements for each part of the door
--- @param spriteIndex integer The index of the door part being processed
function ISThreeTileGarageDoor:overrideModData(spriteIndex)
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

--- Calculate positions for the second part of the door
--- @param square IsoGridSquare The main square for the door
--- @param north boolean Indicates if the door is facing north
--- @return number x, number y, number z Position for the second part
function ISThreeTileGarageDoor:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 1;
    else
        y = y - 1;
    end
    return x, y, z;
end

--- Calculate positions for the third part of the door
--- @param square IsoGridSquare The main square for the door
--- @param north boolean Indicates if the door is facing north
--- @return number x, number y, number z Position for the third part
function ISThreeTileGarageDoor:getSquare3Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 2;
    else
        y = y - 2;
    end
    return x, y, z;
end

--- Checks if a part of the door already exists on a given square
--- @param square IsoGridSquare The square to check
--- @param index number The index of the door part (1, 2, or 3)
--- @return boolean exists True if part exists, false otherwise
function ISThreeTileGarageDoor:partExists(square, index)
    local spriteName = self:getSpriteNameForPart(index, self.north);
    local objects = square:getSpecialObjects();
    for i = 1, objects:size() do
        local object = objects:get(i - 1);
        if
            IsoDoor.getGarageDoorIndex(object) == index and object:getNorth() == self.north and not object:IsOpen() and
            object:getSprite():getName() == spriteName
        then
            return true;
        end
    end
    return false;
end

---Gets the sprite name for a part based on its index and orientation
---@param index integer|string|nil The index of the part
---@param north boolean The orientation of the part
---@return string spriteName The sprite name
function ISThreeTileGarageDoor:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
