---@diagnostic disable: param-type-mismatch
---@class ISWallOverlay : ISBuildingObject
ISWallOverlay = ISBuildingObject:derive("ISWallOverlay");

--- Determines if a given object is a relevant wall for placing the overlay
--- @param isCorner boolean Indicates if the overlay is for a corner
--- @param object IsoObject The object to check
--- @param north boolean Indicates if the overlay faces north
--- @return boolean isRelevant True if the object is a relevant wall, false otherwise
local function isRelevantWall(isCorner, object, north)
    if instanceof(object, "IsoWindow") or object:getProperties():Is(IsoFlagType.solidfloor) then return false; end

    if object:getModData().WindowWall then return true; end

    local properties = object:getProperties()

    if isCorner then
        return properties:Is(IsoFlagType.WallNW) or properties:Is(IsoFlagType.WallSE);
    end

    if north then
        return properties:Is(IsoFlagType.WallN) or properties:Is(IsoFlagType.WindowN) or
        properties:Is(IsoFlagType.WallNW) or properties:Is(IsoFlagType.WallSE) or properties:Is(IsoFlagType.DoorWallN);
    end

    return properties:Is(IsoFlagType.WallW) or properties:Is(IsoFlagType.WindowW) or properties:Is(IsoFlagType.WallNW) or
    properties:Is(IsoFlagType.WallSE) or properties:Is(IsoFlagType.DoorWallW);
end


--- Creates and places the wall overlay in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the overlay faces north
--- @param sprite string The sprite to use for this overlay
function ISWallOverlay:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    local objects = self.sq:getObjects();
    local spriteInstance = getSprite(sprite):newInstance();

    for i = 0, objects:size() - 1 do
        local object = objects:get(i);
        if isRelevantWall(self.isCorner, object, north) then
            local attachedAnimSprite = object:getAttachedAnimSprite();
            if attachedAnimSprite == nil then
                attachedAnimSprite = ArrayList:new();
                object:setAttachedAnimSprite(attachedAnimSprite);
            end
            attachedAnimSprite:add(spriteInstance);
            if isClient() then object:transmitUpdatedSpriteToServer(); end
            break;
        end
    end

    buildUtil.consumeMaterial(self);

    -- self.sq:disableErosion()
    -- local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ() }
    -- sendClientCommand('erosion', 'disableForSquare', args)
end

--- Constructor for creating a new wall overlay instance
--- @param sprite string Main sprite for the overlay
--- @param northSprite string North-facing sprite
--- @return ISWallOverlay ISBuildingObject instance
function ISWallOverlay:new(sprite, northSprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    return o;
end

--- Validates if the placement of the wall overlay is permissible
--- @param square IsoGridSquare The square to validate
--- @return boolean validity True if placement is valid, false otherwise
function ISWallOverlay:isValid(square)
    if not self:haveMaterial(square) then return false; end
    if self.needToBeAgainstWall then
        for i = 0, square:getObjects():size() - 1 do
            local obj = square:getObjects():get(i);
            if isRelevantWall(self.isCorner, obj, self.north) then
                return true;
            end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    end
    return true;
end

--- Renders a ghost tile of the wall overlay for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the overlay will be placed
function ISWallOverlay:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end
