---@class ISTripleFridge : ISBuildingObject
ISTripleFridge = ISBuildingObject:derive('ISTripleFridge')

--- Constructor for creating a new three-tile fridge instance
--- @param sprite string Main sprite for the fridge
--- @param sprite2 string Sprite for the second tile
--- @param sprite3 string Sprite for the third tile
--- @param northSprite string North-facing sprite for the main tile
--- @param northSprite2 string North-facing sprite for the second tile
--- @param northSprite3 string North-facing sprite for the third tile
--- @return ISTripleFridge ISBuildingObject instance
function ISTripleFridge:new(sprite, sprite2, sprite3, northSprite, northSprite2, northSprite3)
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
    o.isWallLike = false;
    o.thumpDmg = 5;
    o.name = 'Three Tile Fridge';

    return o;
end

--- Creates and adds parts of the fridge to the game world
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the fridge is facing north
--- @param sprite string The sprite to use for the main part of the fridge
function ISTripleFridge:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    local square = cell:getGridSquare(x, y, z);
    local xa, ya = self:getSquare2Pos(square, north);
    local xb, yb = self:getSquare3Pos(square, north);
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;

    if self.north then
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
    end

    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, z, north, spriteAName, 2);
    self:createPart(xb, yb, z, north, spriteBName, 3);

    buildUtil.consumeMaterial(self);
end

--- Adds a fridge part to the specified location
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the part is facing north
--- @param sprite string The sprite for this fridge part
--- @param index number The index of the fridge part (1, 2, or 3)
function ISTripleFridge:createPart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    if self:partExists(self.sq, index) then return; end

    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    self.javaObject:setMaxHealth(self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setBreakSound("BreakObject");

    self.javaObject:createContainersFromSpriteProperties();
    for i = 1, self.javaObject:getContainerCount() do
        self.javaObject:getContainerByIndex(i - 1):setExplored(true);
    end

    buildUtil.setInfo(self.javaObject, self);

    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

function ISTripleFridge:walkTo(x, y, z)
    local playerObj = getSpecificPlayer(self.player);
    local square = getCell():getGridSquare(x, y, z);
    local square2 = self:getSquare2(square, self.north);
---@diagnostic disable-next-line: param-type-mismatch
    if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
        return luautils.walkAdj(playerObj, square);
    end
    return luautils.walkAdj(playerObj, square2);
end

local function removeItemFromSquare(square)
    for i = 1, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i - 1);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump);
            break;
        end
    end
end


function ISTripleFridge:removeFromGround(square)
    local isNorth = self:getNorth();
    local positions = {
        self:getSquare2Pos(square, isNorth),
        self:getSquare3Pos(square, isNorth),
    };

    for _, pos in ipairs(positions) do
---@diagnostic disable-next-line: param-type-mismatch
        local xa, ya = unpack(pos);
        local squareA = getCell():getGridSquare(xa, ya, square:getZ());
        removeItemFromSquare(squareA);
    end
end

--- Returns the health of the fridge based on construction parameters
--- @return number health The health value of the fridge
function ISTripleFridge:getHealth()
    return 200 + buildUtil.getWoodHealth(self);
end

--- Renders a ghost tile of the fridge for placement preview
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param square IsoGridSquare The square where the fridge will be placed
function ISTripleFridge:render(x, y, z, square)
    local spriteName;
    if not self:partExists(square, 1) then
        spriteName = self:getSprite();
        local sprite = IsoSprite.new();
        sprite:LoadFramesNoDirPageSimple(spriteName);

        local spriteFree = ISBuildingObject.isValid(self, square);
        if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
            spriteFree = false;
        end
        if spriteFree then
            sprite:RenderGhostTile(x, y, z);
        else
            sprite:RenderGhostTileRed(x, y, z);
        end
    end

    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;

    local spriteAFree = true;
    local spriteBFree = true;

    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
    end

    local squareA = getCell():getGridSquare(xa, ya, z);
    if squareA == nil and getWorld():isValidSquare(xa, ya, z) then
---@diagnostic disable-next-line: param-type-mismatch
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, z);
        getCell():ConnectNewSquare(squareA, false);
    end

    local squareB = getCell():getGridSquare(xb, yb, z);
    if squareB == nil and getWorld():isValidSquare(xb, yb, z) then
---@diagnostic disable-next-line: param-type-mismatch
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, z);
        getCell():ConnectNewSquare(squareB, false);
    end

    local existsA = self:partExists(squareA, 2);
    local existsB = self:partExists(squareB, 3);

    if not existsA and not buildUtil.canBePlace(self, squareA) then
        spriteAFree = false;
    end
    if not existsB and not buildUtil.canBePlace(self, squareB) then
        spriteBFree = false;
    end
    if squareA and (squareA:isSomethingTo(square) or buildUtil.stairIsBlockingPlacement(squareA, true, self.north)) then
        spriteAFree = false;
    end
    if squareB and (squareB:isSomethingTo(squareA) or buildUtil.stairIsBlockingPlacement(squareB, true, self.north)) then
        spriteBFree = false;
    end

    if not existsA then
        local spriteA = IsoSprite.new();
        spriteA:LoadFramesNoDirPageSimple(spriteAName);
        if spriteAFree then
            spriteA:RenderGhostTile(xa, ya, z);
        else
            spriteA:RenderGhostTileRed(xa, ya, z);
        end
    end
    if not existsB then
        local spriteB = IsoSprite.new();
        spriteB:LoadFramesNoDirPageSimple(spriteBName);
        if spriteBFree then
            spriteB:RenderGhostTile(xb, yb, z);
        else
            spriteB:RenderGhostTileRed(xb, yb, z);
        end
    end
end

--- Checks if the placement of the fridge is valid
--- @param square IsoGridSquare The square to validate
--- @return boolean validity True if placement is valid, false otherwise
function ISTripleFridge:isValid(square)
    if not self:haveMaterial(square) then
        return false;
    end
    if not square:hasFloor(self.north) then
        return false;
    end
    if not self:partExists(square, 1) and not square:isFreeOrMidair(false) then
        return false;
    end
    if square:isVehicleIntersecting() then
        return false;
    end

    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);
    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    local squareB = getCell():getGridSquare(xb, yb, square:getZ());

    if (not squareA) or (not squareB) then
        return false;
    end

    local existsA = self:partExists(squareA, 2);
    local existsB = self:partExists(squareB, 3);

    if not existsA and not buildUtil.canBePlace(self, squareA) then
        return false;
    end
    if not existsB and not buildUtil.canBePlace(self, squareB) then
        return false;
    end

    if squareA:isSomethingTo(square) then
        return false;
    end
    if squareB:isSomethingTo(squareA) then
        return false;
    end

    if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
        return false;
    end
    if buildUtil.stairIsBlockingPlacement(squareA, true, self.north) then
        return false;
    end
    if buildUtil.stairIsBlockingPlacement(squareB, true, self.north) then
        return false;
    end

    return true;
end

--- Calculate positions for the second part of the fridge
--- @param square IsoGridSquare The main square for the fridge
--- @param north boolean Indicates if the fridge is facing north
--- @return number x, number y, number z Position for the second part
function ISTripleFridge:getSquare2Pos(square, north)
    local x = square:getX();
    local y = square:getY();
    local z = square:getZ();

    if north then
        x = x + 1;
    else
        y = y - 1;
    end
    return x, y, z;
end

--- Calculate positions for the third part of the fridge
--- @param square IsoGridSquare The main square for the fridge
--- @param north boolean Indicates if the fridge is facing north
--- @return number x, number y, number z Position for the third part
function ISTripleFridge:getSquare3Pos(square, north)
    local x = square:getX();
    local y = square:getY();
    local z = square:getZ();

    if north then
        x = x + 2;
    else
        y = y - 2;
    end
    return x, y, z;
end

--- Checks if a part of the fridge already exists on a given square
--- @param square IsoGridSquare The square to check
--- @param index number The index of the fridge part (1, 2, or 3)
--- @return boolean exists True if part exists, false otherwise
function ISTripleFridge:partExists(square, index)
    local spriteIndex = index;
    if spriteIndex == 1 then spriteIndex = ""; end
    local spriteName = self.north and self["northSprite" .. spriteIndex] or self["sprite" .. spriteIndex];
    local objects = square:getObjects();
    for i = 1, objects:size() do
        local object = objects:get(i - 1);
        if object:getSprite():getName() == spriteName then
            return true;
        end
    end
    return false;
end
