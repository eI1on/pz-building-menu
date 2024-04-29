require("TimedActions/ISRemoveBush")

local WallVinesTiles = require ('BM_ValidWallVineTiles')
--- @type table<string>
-- Load a list of valid patterns for removable wall vine tiles from an external module.
local removableWallVinesTiles = WallVinesTiles.getTiles()


-- Store the original ISRemoveBush.getWallVineObject function for later use.
local originalGetWallVineObject = ISRemoveBush.getWallVineObject;

--- Overrides the getWallVineObject method in ISRemoveBush to add support for custom wall vine tiles.
--- @param square IsoGridSquare The square to check for wall vine objects.
--- @return IsoObject | nil object The IsoObject representing the wall vine, if found.
--- @return integer | nil number index of the attached animation sprite representing the vine, if a wall vine is found; nil otherwise.
function ISRemoveBush:getWallVineObject(square)
    if not square then return nil; end
    for i = 0, square:getObjects():size() - 1 do
        local object = square:getObjects():get(i);
        local attached = object:getAttachedAnimSprite();
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1);
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                    local spriteName = sprite:getParentSprite():getName();
                    for _, pattern in ipairs(removableWallVinesTiles) do
                        if luautils.stringStarts(spriteName, pattern) then
                            return object, n - 1;
                        end
                    end
                end
            end
        end
    end
    return originalGetWallVineObject(self, square);
end
