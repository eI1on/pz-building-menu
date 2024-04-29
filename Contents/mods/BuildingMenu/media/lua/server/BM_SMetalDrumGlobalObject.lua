if isClient() then return end
require 'MetalDrum/SMetalDrumGlobalObject'
-- Handles the custom sprite generation for metal drums based on specified conditions

local customBarrelTiles = require'BM_ValidDrums'
--- @type table<string, table>
-- Cache for already generated sprite names to avoid redundant calculations
local spriteCache = {}


--- Generates sprite names for different states of metal drums based on a sprite name prefix
--- @param spriteName string The base sprite name used to generate specific sprite names
--- @return table|nil sprites A table containing sprite names for various states of the metal drum or nil if not applicable
local function genSprites(spriteName)
    if spriteCache[spriteName] then return spriteCache[spriteName] end
    for _, barrelTiles in ipairs(customBarrelTiles) do
        local prefix = barrelTiles.prefix
        if spriteName:sub(1, #prefix) == prefix then
            local first = tonumber(spriteName:sub(#prefix + 1)) or 0
            first = first - (first % 4)
            local sprites = {
                empty = prefix .. first,
                water = prefix .. (first + 1),
                fire_unlit = prefix .. (first + 2),
                fire_lit = prefix .. (first + 3),
            }
            spriteCache[spriteName] = sprites
            return sprites
        end
    end
end

--- Stores the original `getSprites` method from `SMetalDrumGlobalObject`
local oldGetSprites = SMetalDrumGlobalObject.getSprites

--- Customizes the `getSprites` method of `SMetalDrumGlobalObject`
--- It extends the functionality to use custom sprite names based on the object's current sprite
--- @param ... any Additional parameters passed to the original `getSprites` method
--- @return table sprites A table of sprite names for the metal drum
function SMetalDrumGlobalObject:getSprites(...)
    local isoObj = self:getIsoObject()
    local spriteName = isoObj and isoObj:getSprite():getName() or ""
    return oldGetSprites(self, ...) or genSprites(spriteName)
end
