--- @class ISFloorOverlay : ISBuildingObject
ISFloorOverlay = ISBuildingObject:derive("ISFloorOverlay");

--- Constructor for creating ISFloorOverlay object
--- @param sprite string The sprite for the overlay
--- @param northSprite string The north-facing sprite
--- @return ISFloorOverlay
function ISFloorOverlay:new(sprite, northSprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.buildMid = true;
    o.floor = true;
    return o;
end

--- Creates an overlay on a floor tile
--- @param x number The x coordinate
--- @param y number The y coordinate
--- @param z number The z-level
--- @param north boolean Whether the overlay is facing north
--- @param sprite string The sprite for the overlay
function ISFloorOverlay:create(x, y, z, north, sprite)
    self.sq = getWorld():getCell():getGridSquare(x, y, z);
    local objects = self.sq:getObjects();
    local spriteInstance = getSprite(sprite):newInstance();

    for i = 0, objects:size() - 1 do
        local object = objects:get(i);
        local properties = object:getProperties();
        if (properties and properties:Is(IsoFlagType.solidfloor)) or object:isFloor() then
            local attachedAnimSprite = object:getAttachedAnimSprite();
            if not attachedAnimSprite then
                attachedAnimSprite = ArrayList:new();
                object:setAttachedAnimSprite(attachedAnimSprite);
            end
            attachedAnimSprite:add(spriteInstance);
            if isClient() then object:transmitUpdatedSpriteToServer(); end
        end
    end

    buildUtil.consumeMaterial(self);
end

--- Checks if the square is valid for placing an overlay
--- @param square IsoGridSquare The square to check
--- @return boolean validity
function ISFloorOverlay:isValid(square)
    if not self:haveMaterial(square) then return false; end
    if square:getZ() > 0 then
        local belowSquare = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1);
        if belowSquare and belowSquare:HasStairs() then return false; end
    end
    for i = 0, square:getObjects():size() - 1 do
        local item = square:getObjects():get(i);
        if (item:getTextureName() and luautils.stringStarts(item:getTextureName(), "vegetation_farming")) or
           (item:getSpriteName() and luautils.stringStarts(item:getSpriteName(), "vegetation_farming")) then
            return false;
        end
    end
    return square:connectedWithFloor();
end

--- Renders the ISFloorOverlay object in the game world
--- @param x number The x coordinate
--- @param y number The y coordinate
--- @param z number The z-level
--- @param square IsoGridSquare The square where the overlay will be placed
function ISFloorOverlay:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end