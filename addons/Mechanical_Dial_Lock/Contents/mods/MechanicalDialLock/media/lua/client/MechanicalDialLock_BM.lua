---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addSafesToBuildingMenu()
    local safes = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_2",
                northSprite = "building_menu_dylan_safes_3",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_6",
                northSprite = "building_menu_dylan_safes_7",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_10",
                northSprite = "building_menu_dylan_safes_11",
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Containers"),
        "",
        getText("IGUI_BuildingMenuSubCat_Containers_Safes"),
        "building_menu_dylan_safes_0",
        safes
    )
end

local function addCategoriesToBuildingMenu()
    if getActivatedMods():contains("BuildingMenu") then
        addSafesToBuildingMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)