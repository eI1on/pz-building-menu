--- @class ISBathtub : ISBuildingObject
ISBathtub = ISBuildingObject:derive("ISBathtub");

--- Constructor for the ISBathtub class
--- @param playerNum integer The player index creating the bathtub
--- @param name string The name of the bathtub object
--- @param sprite string The sprite for the bathtub when not facing north
--- @param sprite2 string The second sprite for the bathtub
--- @param northSprite string The sprite for the bathtub when facing north
--- @param northSprite2 string The second north-facing sprite for the bathtub
--- @return ISBathtub ISBuildingObject instance
function ISBathtub:new(playerNum, name, sprite, sprite2, northSprite, northSprite2)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.player = playerNum;
    o.name = name;
    o.sprite2 = sprite2;
    o.northSprite2 = northSprite2;
    o.canBarricade = false;
    o.dismantable = true;
    o.blockAllTheSquare = true;
    o.canBeAlwaysPlaced = true;
    o.buildLow = false;
    return o
end

--- Creates a bathtub at the specified location
--- @param x integer The x coordinate of the location
--- @param y integer The y coordinate of the location
--- @param z integer The z coordinate of the location
--- @param north boolean Whether the bathtub is facing north
--- @param sprite string The sprite name for the bathtub
function ISBathtub:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);
    self:createPart(self.sq, north, sprite);

    local spriteAName = self.northSprite2;
    local xa, ya = x, y;

    if north then
        ya = ya - 1;
    else
        spriteAName = self.sprite2;
        xa = xa - 1;
    end

    local squareA = cell:getGridSquare(xa, ya, z);
    local oldModData = self.modData;
    self.modData = {};
    self:createPart(squareA, north, spriteAName);

    self.modData = oldModData;
    buildUtil.consumeMaterial(self);
end

--- Configures and places a thumpable object at a given location
--- @param square IsoGridSquare The grid square where the object will be placed
--- @param north boolean Whether the object faces north
--- @param sprite string The sprite to use for this object
function ISBathtub:createPart(square, north, sprite)
    local thumpable = IsoThumpable.new(getCell(), square, sprite, north, self);

    thumpable:setMaxHealth(self:getHealth());
    thumpable:setHealth(thumpable:getMaxHealth());
    thumpable:setBreakSound("BreakObject");

    buildUtil.setInfo(thumpable, self);

    square:AddSpecialObject(thumpable);
    thumpable:transmitCompleteItemToServer();
end

--- Removes the bathtub from the ground
--- @param square IsoGridSquare The square from which to remove the bathtub
function ISBathtub:removeFromGround(square)
    for i = 0, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump);
            break;
        end
    end

    local xa, ya = square:getX(), square:getY();
    if self:getNorth() then
        ya = ya - 1;
    else
        xa = xa - 1;
    end

    square = getCell():getGridSquare(xa, ya, square:getZ());
    for i = 0, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump);
            break;
        end
    end
end

--- Calculates the health of the bathtub based on carpentry skill
--- @return integer health The calculated health
function ISBathtub:getHealth()
    return 300 + buildUtil.getWoodHealth(self);
end

--- Renders a ghost tile of the bathtub for placement preview
--- @param x integer The x coordinate where to render
--- @param y integer The y coordinate where to render
--- @param z integer The z coordinate where to render
--- @param square IsoGridSquare The square where the rendering takes place
function ISBathtub:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
    local spriteAName = self.northSprite2;
    local spriteAFree = true;
    local xa, ya, za = self:getSquare2Pos(square, self.north);

    if not self.north then
        spriteAName = self.sprite2;
    end

    local squareA = getCell():getGridSquare(xa, ya, za);
    if not self.canBeAlwaysPlaced and (not squareA or not squareA:isFreeOrMidair(true)) then
        spriteAFree = false;
    end

    if squareA and squareA:isVehicleIntersecting() then
        spriteAFree = false;
    end

    local spriteA = IsoSprite.new();
    spriteA:LoadFramesNoDirPageSimple(spriteAName);
    if spriteAFree then
        spriteA:RenderGhostTile(xa, ya, za);
    else
        spriteA:RenderGhostTileRed(xa, ya, za);
    end
end

--- Determines if the placement of the bathtub is valid
--- @param square IsoGridSquare The square to check for validity
--- @return boolean validity True if placement is valid, false otherwise
function ISBathtub:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false;
    end
	if square:isVehicleIntersecting() then
        return false;
    end
    if buildUtil.stairIsBlockingPlacement(square, true) then
        return false;
    end

    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local squareA = getCell():getGridSquare(xa, ya, za);
    if not squareA or not squareA:isFreeOrMidair(true) or buildUtil.stairIsBlockingPlacement(squareA, true) then
        return false;
    end
    if squareA:isVehicleIntersecting() then
        return false;
    end
    return true;
end

--- Calculates the coordinates for the second square based on the orientation
--- @param square IsoGridSquare The reference square
--- @param north boolean The orientation
--- @return integer x, integer y, integer z The x, y, and z coordinates of the second square
function ISBathtub:getSquare2Pos(square, north)
    local x = square:getX();
    local y = square:getY();
    local z = square:getZ();
    if north then
        y = y - 1;
    else
        x = x - 1;
    end
    return x, y, z;
end

--- Retrieves the second square based on the orientation
--- @param square IsoGridSquare The reference square
--- @param north boolean The orientation
--- @return IsoGridSquare square The second square
function ISBathtub:getSquare2(square, north)
    local x, y, z = self:getSquare2Pos(square, north);
    return getCell():getGridSquare(x, y, z);
end
