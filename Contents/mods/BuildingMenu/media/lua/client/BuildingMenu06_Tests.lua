---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
local BM_Utils = require("BM_Utils")


-- function checkCornerProperties()
--     local stringBuffer = {};
--     for _, tab in ipairs(BuildingMenu.Tabs) do
--         for _, category in ipairs(tab.categories) do
--             for _, subcategory in ipairs(category.subcategories) do
--                 for _, object in ipairs(subcategory.objects) do
--                     local sprites = object.data.sprites

--                     if sprites.corner and sprites.sprite and sprites.northSprite then
--                         local cornerSprite = sprites.corner
--                         local spriteName = sprites.sprite
--                         local northSpriteName = sprites.northSprite

--                         local cornerProperties = getSprite(cornerSprite):getProperties()

--                         if not cornerProperties:Is("CornerWestWall") and not cornerProperties:Is("CornerNorthWall") then
--                             table.insert(stringBuffer,
--                                 string.format(
--                                     'BM_Utils.setOrUnsetSpriteProperties(manager, { "%s", }, { { "CornerWestWall", "%s", false }, { "CornerNorthWall", "%s", false } }); ',
--                                     cornerSprite, spriteName, northSpriteName))
--                         end
--                     end
--                 end
--             end
--         end
--     end
--     local stringText = table.concat(stringBuffer);
--     print(stringText)
-- end

-- checkCornerProperties()