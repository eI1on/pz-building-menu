if isClient() then return end
require 'MetalDrum/SMetalDrumGlobalObject'

local customBarrelTiles = unpack(require 'BM_ValidDrums')
local spriteCache = {}

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

local oldGetSprites = SMetalDrumGlobalObject.getSprites
function SMetalDrumGlobalObject:getSprites(...)
    local isoObj = self:getIsoObject()
    local spriteName = isoObj and isoObj:getSprite():getName() or ""
    return oldGetSprites(self, ...) or genSprites(spriteName)
end