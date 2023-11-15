require("TimedActions/ISRemoveBush")

local RemovableWallVinesTiles = require 'ValidWallVineTiles'

local originalGetWallVineObject = ISRemoveBush.getWallVineObject

function ISRemoveBush:getWallVineObject(square)
	if not square then return nil end
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
		local attached = object:getAttachedAnimSprite()
		if attached then
			for n=1,attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                    local spriteName = sprite:getParentSprite():getName()
                    for _, pattern in ipairs(RemovableWallVinesTiles) do
                        if luautils.stringStarts(spriteName, pattern) then
                            return object, n-1
                        end
                    end
                end
			end
		end
	end
    return originalGetWallVineObject(self, square)
end