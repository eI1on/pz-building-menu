require("BuildingObjects/ISRemovePlantCursor")

local RemovableWallVinesTiles = require 'ValidWallVineTiles'

local originalGetRemovableObject = ISRemovePlantCursor.getRemovableObject

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
                        for _, pattern in ipairs(RemovableWallVinesTiles) do
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

