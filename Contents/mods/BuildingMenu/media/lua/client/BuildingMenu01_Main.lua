---@type function
local getText = getText 
---@type function
local pairs = pairs
---@type function
local ipairs = ipairs
---@class PerkFactory
local PerkFactory = PerkFactory
---@type function
local getSpecificPlayer = getSpecificPlayer
---@type function
local getSprite = getSprite
---@type function
local getItemNameFromFullType = getItemNameFromFullType
---@type function

--- BuildingMenu namespace.
---@class BuildingMenu
local BuildingMenu = {}

---@type boolean
BuildingMenu.playerCanPlaster = false

---@type string
BuildingMenu.textTooltipHeader = '<RGB:1,1,1> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ': <LINE> '

---@type string
BuildingMenu.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))

---@type string
BuildingMenu.ghs = " <RGB:" .. getCore():getGoodHighlitedColor():getR() .. "," .. getCore():getGoodHighlitedColor():getG() .. "," .. getCore():getGoodHighlitedColor():getB() .. "> "

---@type string
BuildingMenu.bhs = " <RGB:" .. getCore():getBadHighlitedColor():getR() .. "," .. getCore():getBadHighlitedColor():getG() .. "," .. getCore():getBadHighlitedColor():getB() .. "> "


-- Tags: Screwdriver, CutPlant, DigPlow (eg: HandFork), Sledgehammer, ChopTree (eg: Axe), ClearAshes (eg: Broom), TakeDirt (eg: Shovel), Crowbar, Hammer, RemoveBarricade (eg: Claw Hammer)

--- Definitions of tools used in the building menu.
---@type table<string, table>
BuildingMenu.Tools = {}
BuildingMenu.Tools = {
    Hammer = {
        types = {
            'Base.Hammer',
            'Base.HammerStone',
            'Base.BallPeenHammer',
            'Base.ClubHammer',
            'ToolsOfTheTrade.BrickHammer', --Tools of the Trade
            'ToolsOfTheTrade.StubbyHammer', --Tools of the Trade
            'MWPWeapons.oxnailhammer', -- [Reworked] MWPWeapons
            'MWPWeapons.fatmaxbrickhammer', -- [Reworked] MWPWeapons
            'MWPWeapons.m48tacticalwarhammer', -- [Reworked] MWPWeapons
        },
        tags = {'Hammer'}
    },
    Sledgehammer = {
        types = {
            'Base.Sledgehammer',
            'Base.Sledgehammer2',
            'ToolsOfTheTrade.PoliceBreachingHammer', --Tools of the Trade
            'ToolsOfTheTrade.RailwaySpikeHammer', --Tools of the Trade
            'ToolsOfTheTrade.WarHammer', --Tools of the Trade
            'ToolsOfTheTrade.IndustrialBreachingHammer', --Tools of the Trade
            'ToolsOfTheTrade.CoreHammer', --Tools of the Trade
            'ToolsOfTheTrade.RailroadHammer', --Tools of the Trade
            'ToolsOfTheTrade.RebarHammer', --Tools of the Trade
            'ToolsOfTheTrade.DefilerSledgehammer', --Tools of the Trade
            'ToolsOfTheTrade.DespoilerSledgehammer', --Tools of the Trade
            'SWeapons.SalvagedSledgehammer', -- Scrap Weapons
            'SWeapons.GearMace', -- Scrap Weapons
            'SWeapons.HugeScrapPickaxe', -- Scrap Weapons
            'MWPWeapons.roughneckgorillasledgehammer',-- [Reworked] MWPWeapons
            'AuthenticZClothing.AuthenticTagillaSledgehammer', -- Authentic Z
            'KWP.StoneSledgehammer', --- Kwin's Melee Weapon Pack
        },
        tags = {'Sledgehammer'}
    },
    Paintbrush = {
        types = {'Base.Paintbrush'},
        tags = {}
    },
    Screwdriver = {
        types = {
            'Base.Screwdriver',
            'ToolsOfTheTrade.Multitool', --Tools of the Trade
            'ToolsOfTheTrade.SpiffArmyKnife', --Tools of the Trade
        },
        tags = {'Screwdriver'}
    },
    Saw = {
        types = {
            'Base.Saw',
            'Base.GardenSaw',
            'ToolsOfTheTrade.Backsaw', -- Tools of the Trade
            'ToolsOfTheTrade.RyobaSaw', -- Tools of the Trade
        },
        tags = {'Saw'}
    },
    HandShovel = {
        types = {
            'farming.HandShovel',
            'SOMW.SharpTrowel',
            'ToolsOfTheTrade.Adze', --Tools of the Trade
        },
        tags = {'DigPlow'}
    },
    Shovel = {
        types = {
            'Base.Shovel',
            'SOMW.EntrenchingShovel', --SOMW
            'MWPWeapons.sptesnaztacticalshovel', -- [Reworked] MWPWeapons
            'ToolsOfTheTrade.TrenchShovel' -- Tools of the Trade
        },
        tags = {'TakeDirt'}
    },
    BlowTorch = {
        types = {'Base.BlowTorch'},
        tags = {}
    },
    WeldingMask = {
        types = {
            'Base.WeldingMask',
            'AuthenticZClothing.Hat_TagillaMask2', -- Authentic Z
            'AuthenticZClothing.Hat_TagillaMask', -- Authentic Z
            'Base.Hat_WelderMask2' -- Scrap Armor
        },
        tags = {'WeldingMask'}
    },
    Needle = {
        types = {'Base.Needle'},
        tags = {'SewingNeedle'}
    }
}


--- Definitions of materials used in the building menu.
---@type table<string, table>
BuildingMenu.ItemsAlternatives = {};
BuildingMenu.ItemsAlternatives = {
    GlassPane = {
        "Base.GlassPane",
        "ImprovisedGlass.GlassPane",
        "filcher.SFGlassPanel",
        "Base.SmallGlassPanel"
    },
}


BuildingMenu.GroupsAlternatives = {};
BuildingMenu.GroupsAlternatives = {
    Nails = {
        {
            Item = "Base.Nails",
            Multiplier = 1,
        },
        {
            Item = "TW.LargeBolt",
            Multiplier = 0.75,
        }
    },
    Rope = {
        {
            Item = "Base.Rope",
            Multiplier = 1,
        },
        {
            Item = "Base.SheetRope",
            Multiplier = 1,
        }
    },
    GlassPanes = {
        {
            Item = BuildingMenu.ItemsAlternatives.GlassPane,
            Multiplier = 1,
        },
        {
            Item = "Base.BigGlassPanel",
            Multiplier = 0.5,
        }
    }
};


--- Function called to fill the world object context menu.
---@param playerNum number
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
BuildingMenu.OnFillWorldObjectContextMenu = function(playerNum, context, worldobjects, test)
    if getCore():getGameMode() == "LastStand" then return end
    if test and ISWorldObjectContextMenu.Test then return true end

    local playerObj = getSpecificPlayer(playerNum)

    if playerObj:getVehicle() then return end


    if BuildingMenu.getPlayerSkills(playerObj)["Woodwork"] > 7 or ISBuildMenu.cheat then
        BuildingMenu.playerCanPlaster = true
    else
        BuildingMenu.playerCanPlaster = false
    end

    local option = context:insertOptionBefore(getText("ContextMenu_Build"), getText("ContextMenu_BuildingMenu"), worldobjects, function()
        ISBuildingMenuUI.openPanel(playerObj);
    end)
    option.iconTexture = getTexture("media/ui/building_menu.png");

end
Events.OnFillWorldObjectContextMenu.Add(BuildingMenu.OnFillWorldObjectContextMenu)
Events.OnGameBoot.Add(function() print("[Building Menu] ver:MAR_12_2024") end)

--- Gets the player's skills.
---@param playerObj IsoPlayer
---@return table<string, number>
BuildingMenu.getPlayerSkills = function(playerObj)
    local skills = {}
    local perks = PerkFactory.PerkList
    for i = 0, perks:size() - 1 do
        local perkID = perks:get(i):getId()
        skills[perkID] = playerObj:getPerkLevel(perks:get(i))
    end
    return skills
end

--- Utility function for debug printing.
---@param prefix string
---@param data any
BuildingMenu.debugPrint = function(prefix, data)
    if type(data) == "table" then
        for key, value in pairs(data) do
            if type(value) == "table" then
                print(prefix .. key .. ":")
                BuildingMenu.debugPrint(prefix .. "\t", value)
            else
                print(prefix .. key .. ": " .. tostring(value))
            end
        end
    else
        print(prefix .. tostring(data))
    end
end


--- Predicate function to check if an item is not broken.
---@param item InventoryItem
---@return boolean
BuildingMenu.predicateNotBroken = function(item)
    return not item:isBroken()
end

--- Predicate function to check if an item has a specific tag.
---@param item InventoryItem
---@param tag string
---@return boolean
BuildingMenu.predicateHasTag = function(item, tag)
    return not item:isBroken() and item:hasTag(tag)
end

--- Calculates the uses of a welding rod.
---@param torchUses number
---@return number
BuildingMenu.weldingRodUses = function(torchUses)
    return math.floor((torchUses + 0.1) / 2)
end

--- Rounds a number to a specified number of decimal places.
--- If `numDecimalPlaces` is not provided or less than 1, the number is rounded to the nearest integer.
--- @param num number The number to round.
--- @param numDecimalPlaces number|nil The number of decimal places to round to. Optional; if nil or less than 1, rounds to the nearest integer.
--- @return number num The rounded number.
BuildingMenu.round = function(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces > 0 then
        local multiplier = 10 ^ numDecimalPlaces
        return math.floor(num * multiplier + 0.5) / multiplier
    end

    local roundedNum = math.floor(num + 0.5)
    return math.max(roundedNum, 1)
end

--- Gets the display name of a moveable object.
---@param sprite string
---@return string|nil
BuildingMenu.getMoveableDisplayName = function(sprite)
    local props = getSprite(sprite):getProperties()
    if props:Is('CustomName') then
        local name = props:Val('CustomName')
        if props:Is('GroupName') then
            name = props:Val('GroupName') .. ' ' .. name
        end
        return Translator.getMoveableDisplayName(name)
    end
    return nil
end

--- Checks if the player has a tool to build.
---@param inv ItemContainer
---@return boolean
BuildingMenu.haveAToolToBuild = function(inv)
    local toolInfo = BuildingMenu.Tools['Hammer']
    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            if inv:containsTypeEvalRecurse(type, BuildingMenu.predicateNotBroken) then
                return true
            end
        end
    end
    if toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            if inv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, tag) end) then
                return true
            end
        end
    end
    return false
end

--- Gets the available tool from the inventory.
---@param inv ItemContainer
---@param tool string
---@return InventoryItem|nil
BuildingMenu.getAvailableTool = function(inv, tool)
    local toolInfo = BuildingMenu.Tools[tool]
    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            local item = inv:getBestTypeEvalRecurse(type, BuildingMenu.predicateNotBroken)
            if item then return item end
        end
    end
    if toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            local item = inv:getBestEvalRecurse( function(item) return BuildingMenu.predicateHasTag(item, tag) end, function(item) return true end )
            if item then return item end
        end
    end
    return nil
end

--- Equips a primary tool for the player.
---@param object any
---@param playerNum number
---@param tool string
BuildingMenu.equipToolPrimary = function(object, playerNum, tool)
    local item = nil
    local inv = getSpecificPlayer(playerNum):getInventory()
    item = BuildingMenu.getAvailableTool(inv, tool)
    if not item then return end

    ISInventoryPaneContextMenu.equipWeapon(item, true, item:isTwoHandWeapon(), playerNum)
    object.noNeedHammer = true
end

--- Equips a secondary tool for the player.
---@param object any
---@param playerNum number
---@param tool string
BuildingMenu.equipToolSecondary = function(object, playerNum, tool)
    local item = nil
    local inv = getSpecificPlayer(playerNum):getInventory()
    item = BuildingMenu.getAvailableTool(inv, tool)
    if not item then return end
    if instanceof(item, "Clothing") then
        if not item:isEquipped() then
            ISInventoryPaneContextMenu.wearItem(item, playerNum)
        end
    else
        -- ISInventoryPaneContextMenu.equipWeapon(item, false, item:isTwoHandWeapon(), playerNum)
    end
end


---@param type string
---@return InventoryItem
function BuildingMenu.GetItemInstance(type)
    if not BuildingMenu.ItemInstances then BuildingMenu.ItemInstances = {}; end
    local item = BuildingMenu.ItemInstances[type];
    if not item then
        item = InventoryItemFactory.CreateItem(type);
        if item then
            BuildingMenu.ItemInstances[type] = item;
            BuildingMenu.ItemInstances[item:getFullType()] = item;
        end
    end
    return item
end

--- Tooltip check for a specific tool category.
---@param playerInv ItemContainer
---@param tool string
---@param tooltip ISToolTip
---@return boolean
BuildingMenu.tooltipCheckForTool = function(playerInv, tool, tooltip)
    local toolInfo = BuildingMenu.Tools[tool]
    local found = false

    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            local item = playerInv:getBestTypeEvalRecurse(type, BuildingMenu.predicateNotBroken)
            if item then
                tooltip.description = tooltip.description .. BuildingMenu.ghs .. item:getName() .. ' <LINE>';
                found = true;
                break
            end
        end
    end

    if not found and toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            local item = playerInv:getBestEvalRecurse( function(item) return BuildingMenu.predicateHasTag(item, tag) end, function(item) return true end )
            if item then
                tooltip.description = tooltip.description .. BuildingMenu.ghs .. item:getName() .. ' <LINE>'
                found = true
                break
            end
        end
    end

    if not found then
        tooltip.description = tooltip.description .. BuildingMenu.bhs .. ((toolInfo.types and toolInfo.types[1] and getItemNameFromFullType(toolInfo.types[1])) or tool) .. ' <LINE>'
        return false
    end
    return true
end


local function tooltipCheckForItem(playerObj, playerInv, currentItemGroup, tooltip, groupType)
    local groupItemFound = false;
    local itemBuffer = {};
    local itemInfo = {};
    local groundItems = buildUtil.getMaterialOnGround(playerObj:getCurrentSquare());
    local groundItemCountMap = {};
    
    -- Prepare ground item counts
    if groupType == "Consumable" then
        groundItemCountMap = buildUtil.getMaterialOnGroundUses(groundItems);
    else
        for groundItemType, itemsOnGround in pairs(groundItems) do
            groundItemCountMap[groundItemType] = #itemsOnGround;
        end
    end

    -- Iterate over each alternative Material/Consumable group
    for altGroupIndex, altGroup in pairs(currentItemGroup) do
        local items = type(altGroup[groupType]) == "table" and altGroup[groupType] or {altGroup[groupType]};
        local totalAmountNeeded = altGroup.Amount;
        local totalFoundCount = 0;
        local itemDetails = {};
        local firstItemInstance = nil;

        -- Iterate over each material Full Type within the alternative Material/Consumable group
        for _, itemFullType in pairs(items) do
            local item = BuildingMenu.GetItemInstance(itemFullType);
            if item then
                local itemCount = 0;
                if groupType == "Consumable" then
                    itemCount = playerInv:getUsesTypeRecurse(itemFullType);
                    if groundItemCountMap[itemFullType] then
                        for _, groundItem in ipairs(groundItemCountMap[itemFullType]) do
                            itemCount = itemCount + groundItem:getDrainableUsesInt();
                        end
                    end
                else
                    itemCount = playerInv:getItemCountFromTypeRecurse(itemFullType) + (groundItemCountMap[itemFullType] or 0);
                end

                totalFoundCount = totalFoundCount + itemCount;
                if itemCount >= 0 then
                    itemDetails[itemFullType] = itemCount;
                    if not firstItemInstance then
                        firstItemInstance = item;
                    end
                end
            end
        end

        local itemFound = totalFoundCount >= totalAmountNeeded;
        local color = itemFound and BuildingMenu.ghs or BuildingMenu.bhs;
        groupItemFound = groupItemFound or itemFound;

        if not firstItemInstance then
            firstItemInstance = BuildingMenu.GetItemInstance(items[1]);
        end

        if firstItemInstance then
            local itemText = color .. firstItemInstance:getName() .. ' ' .. (groupType == "Consumable" and getText("ContextMenu_Uses") .. " " or "") .. totalFoundCount .. '/' .. totalAmountNeeded;
            itemInfo[altGroupIndex] = {
                AmountNeeded = totalAmountNeeded,
                [groupType .. "Details"] = itemDetails
            };

            if altGroupIndex > 1 then
                table.insert(itemBuffer, " <LINE> " .. color .. getText("ContextMenu_or") .. " ");
            end
            table.insert(itemBuffer, itemText);
        end
    end

    local itemText = table.concat(itemBuffer);
    tooltip.description = tooltip.description .. itemText .. ' <LINE>';
    return groupItemFound, itemInfo;
end


--- Tooltip check for a specific material.
---@param playerObj IsoPlayer
---@param playerInv ItemContainer
---@param currentMaterialsGroup table
---@param tooltip ISToolTip
---@return boolean, table
BuildingMenu.tooltipCheckForMaterial = function(playerObj, playerInv, currentMaterialsGroup, tooltip)
    return tooltipCheckForItem(playerObj, playerInv, currentMaterialsGroup, tooltip, "Material")
end


--- Tooltip check for a consumable item.
---@param playerObj IsoPlayer
---@param playerInv ItemContainer
---@param currentConsumableGroup table
---@param tooltip ISToolTip
---@return boolean, table
BuildingMenu.tooltipCheckForConsumable = function(playerObj, playerInv, currentConsumableGroup, tooltip)
    return tooltipCheckForItem(playerObj, playerInv, currentConsumableGroup, tooltip, "Consumable")
end


local function adaptRecipeGroupToNewFormat(materialOrGroup)
    if materialOrGroup.Material or materialOrGroup.Consumable then
        return {materialOrGroup};
    elseif type(materialOrGroup[1]) == "table" and (materialOrGroup[1].Material or materialOrGroup[1].Consumable)then
        return materialOrGroup;
    end
end


--- Checks if the player can build a specific object.
---@param playerObj IsoPlayer
---@param tooltip ISToolTip
---@param objectRecipe table
---@return ISToolTip, boolean, table, table
BuildingMenu.canBuildObject = function(playerObj, tooltip, objectRecipe)
    local playerInv = playerObj:getInventory();

    tooltip.description = BuildingMenu.textTooltipHeader;

    local canBuildResult = true;
    local currentResult = true;
    local consumablesFoundIndexMatrix = {};
    local materialFoundIndexMatrix = {};

    if not objectRecipe then
        tooltip.description = tooltip.description .. " <LINE>" .. BuildingMenu.bhs .." RECIPE IS NULL";
        return tooltip, false, materialFoundIndexMatrix, consumablesFoundIndexMatrix;
    end

    if objectRecipe.useConsumable then
        local consumablesGroupInfo = {};
        for i, currentConsumableGroup in ipairs(objectRecipe.useConsumable) do
            local adaptedConsumableGroup = adaptRecipeGroupToNewFormat(currentConsumableGroup);
            currentResult, consumablesGroupInfo = BuildingMenu.tooltipCheckForConsumable(
                playerObj,
                playerInv,
                adaptedConsumableGroup,
                tooltip
            );
            consumablesFoundIndexMatrix[i] = consumablesGroupInfo;

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    if objectRecipe.neededMaterials then
        local materialsGroupInfo = {};
        for i, materialsGroup in ipairs(objectRecipe.neededMaterials) do
            local adaptedMaterialsGroup = adaptRecipeGroupToNewFormat(materialsGroup);
            currentResult, materialsGroupInfo = BuildingMenu.tooltipCheckForMaterial(
                playerObj,
                playerInv,
                adaptedMaterialsGroup,
                tooltip
            );
            materialFoundIndexMatrix[i] = materialsGroupInfo;

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    tooltip.description = tooltip.description .. " <LINE>";

    if objectRecipe.neededTools then
        for _, _currentTool in pairs(objectRecipe.neededTools) do
            currentResult = BuildingMenu.tooltipCheckForTool(
                playerInv,
                _currentTool,
                tooltip
            )

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    tooltip.description = tooltip.description .. " <LINE>";

    local playerSkills = BuildingMenu.getPlayerSkills(playerObj)
    if objectRecipe.skills then
        for _, skill in pairs(objectRecipe.skills) do
            if playerSkills[skill.Skill] < skill.Level then
                tooltip.description = tooltip.description .. BuildingMenu.bhs .. getText("IGUI_perks_" .. skill.Skill)  .. " " .. playerSkills[skill.Skill] .. "/" .. skill.Level .. " <LINE>";
                canBuildResult = false;
            else
                tooltip.description = tooltip.description .. BuildingMenu.ghs .. getText("IGUI_perks_" .. skill.Skill) .. " " .. playerSkills[skill.Skill] .. "/" .. skill.Level .. " <LINE>";
            end
        end
    end

    tooltip.description = tooltip.description .. BuildingMenu.textCanRotate;

    -- BuildingMenu.debugPrint("[Building Menu DEBUG] materialFoundIndexMatrix ", materialFoundIndexMatrix);
    -- BuildingMenu.debugPrint("[Building Menu DEBUG] consumablesFoundIndexMatrix ", consumablesFoundIndexMatrix);

    if ISBuildMenu.cheat then
        tooltip.description = "<LINE> <LINE> <RGB:1,0.8,0> Build Cheat Mode Active " .. tooltip.description;
        return tooltip, true, materialFoundIndexMatrix, consumablesFoundIndexMatrix;
    else
        return tooltip, canBuildResult, materialFoundIndexMatrix, consumablesFoundIndexMatrix;
    end
end

--- Returns the BuildingMenu instance.
---@return BuildingMenu
return BuildingMenu