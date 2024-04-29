require("BuildingObjects/ISRemovePlantCursor")

-- Import a list of valid wall vine tiles
local WallVinesTiles = require 'BM_ValidWallVineTiles'
local removableWallVinesTiles = WallVinesTiles.getTiles()

-- Store the original 'getRemovableObject' function to maintain base functionality
local originalGetRemovableObject = ISRemovePlantCursor.getRemovableObject

--- Extends the ISRemovePlantCursor to handle the removal of wall vine objects
--- This function overrides the standard behavior to include checking for custom wall vines that can be removed
---@param square IsoGridSquare The game square to check for removable objects.
---@return IsoObject|nil object The object that can be removed if found, nil otherwise.
function ISRemovePlantCursor:getRemovableObject(square)
    for i = 1, square:getObjects():size() do
        local o = square:getObjects():get(i - 1)
        if self.removeType == "wallVine" then
            local attached = o:getAttachedAnimSprite()
            if attached then
                for n = 1, attached:size() do
                    local sprite = attached:get(n - 1)
                    if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                        local spriteName = sprite:getParentSprite():getName()
                        for _, pattern in ipairs(removableWallVinesTiles) do
                            if luautils.stringStarts(spriteName, pattern) then
                                return o
                            end
                        end
                    end
                end
            end
        end
    end
    return originalGetRemovableObject(self, square)
end
