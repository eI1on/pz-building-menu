---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
local BM_Utils = require("BM_Utils")

-- local function addSiloGeneratorPiecesToMenu()
--     local siloGeneratorPieces = {
--         BuildingMenu.createObject(
--             "",
--             "",
--             BuildingMenu.onBuildEigthTileFurniture,
--             BuildingMenu.WallDecorationRecipe,
--             true,
--             {
--                 isMid = true,
--                 canPassThrough = true,
--             },
--             { sprite = "industry_02_71", sprite2 = "industry_02_67", sprite3 = "industry_02_66", sprite4 = "industry_02_65",
--             sprite5 = "industry_02_64", sprite6 = "industry_02_68", sprite7 = "industry_02_69", sprite8 = "industry_02_70" }                                                                                                  -- Silo Generator1
--         ),
--     }

--     BuildingMenu.addObjectsToCategories(
--         "Factory Pieces",
--         getText("All"),
--         "security_01_1",
--         getText("Generators"),
--         "industry_02_67",
--         siloGeneratorPieces
--     )
-- end


-- Events.OnGameStart.Add(addSiloGeneratorPiecesToMenu)