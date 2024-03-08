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
BuildingMenu = {}

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
            'SWeapons.SalvagedSledgehammer', -- Scrap Weapons
            'MWPWeapons.roughneckgorillasledgehammer',-- [Reworked] MWPWeapons
            'AuthenticZClothing.AuthenticTagillaSledgehammer', -- Authentic Z
        },
        tags = {'Sledgehammer'}
    },
    Paintbrush = {
        types = {'Base.Paintbrush'},
        tags = {}
    },
    Screwdriver = {
        types = {'Base.Screwdriver'},
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
        types = {'farming.HandShovel'},
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
BuildingMenu.Materials = {}
BuildingMenu.Materials = {
    GlassPane = {
        "Base.GlassPane",
        "ImprovisedGlass.GlassPane",
        "filcher.SFGlassPanel",
        "Base.SmallGlassPanel"
    },
}


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
Events.OnGameBoot.Add(function() print("[Building Menu] ver:MAR_02_2024") end)

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


--- Tooltip check for a specific material.
---@param playerObj IsoPlayer
---@param playerInv ItemContainer
---@param currentMaterialGroup table
---@param tooltip ISToolTip
---@return boolean, table
BuildingMenu.tooltipCheckForMaterial = function(playerObj, playerInv, currentMaterialGroup, tooltip)
    local materialFound = false;
    local materialsBuffer = {};
    local materialCountsInfo = {};

    local groundItems = buildUtil.getMaterialOnGround(playerObj:getCurrentSquare());
    local groundItemCountMap = {};

    -- Prepare ground item counts
    for groundItemType, itemsOnGround in pairs(groundItems) do
        groundItemCountMap[groundItemType] = #itemsOnGround;
    end

    -- Iterate over each material group
    for groupIndex, matGroup in pairs(currentMaterialGroup) do
        local materials = type(matGroup.Material) == "table" and matGroup.Material or { matGroup.Material };
        local totalAmountNeeded = matGroup.Amount;
        local totalFoundCount = 0;
        local materialDetails = {};
        local firstMaterialName = nil;

        -- Iterate over each material within the group
        for _, material in pairs(materials) do
            local invItemCount = playerInv:getItemCountFromTypeRecurse(material);
            local groundCount = groundItemCountMap[material] or 0;
            local totalMaterialCount = invItemCount + groundCount;

            totalFoundCount = totalFoundCount + totalMaterialCount;

            -- Store individual material count details
            if totalMaterialCount > 0 then
                materialDetails[material] = totalMaterialCount;
                if not firstMaterialName then
                    firstMaterialName = material;
                end
            end
        end

        -- Check if total found count meets the requirement
        materialFound = totalFoundCount >= totalAmountNeeded;
        local color = materialFound and BuildingMenu.ghs or BuildingMenu.bhs;

        if not firstMaterialName then firstMaterialName = materials[1]; end

        -- Prepare display text for the first material as a representative
        local representativeMaterial = BuildingMenu.GetItemInstance(firstMaterialName):getName(); -- Directly accessing the first element
        local itemText = color .. representativeMaterial .. ' ' .. totalFoundCount .. '/' .. totalAmountNeeded;

        -- Store count details for use in building process
        materialCountsInfo[groupIndex] = {
            AmountNeeded = totalAmountNeeded,
            MaterialDetails = materialDetails
        };

        -- Append to the materials buffer
        if groupIndex > 1 then
            table.insert(materialsBuffer, " <LINE> " .. color .. getText("ContextMenu_or") .. " ");
        end
        table.insert(materialsBuffer, itemText);
    end

    -- Concatenate buffer to form materials text and update tooltip
    local materialsText = table.concat(materialsBuffer);
    tooltip.description = tooltip.description .. materialsText .. ' <LINE>';

    return materialFound, materialCountsInfo;
end


--- Tooltip check for a consumable item.
---@param playerObj IsoPlayer
---@param playerInv ItemContainer
---@param currentConsumableGroup table
---@param tooltip ISToolTip
---@return boolean, number
BuildingMenu.tooltipCheckForConsumable = function(playerObj, playerInv, currentConsumableGroup, tooltip)
    local consumableFound = false;
    local consumablesBuffer = {};
    local consumableFoundIndex = 1;

    local groundItems = buildUtil.getMaterialOnGround(playerObj:getCurrentSquare());
    local groundItemsUses = buildUtil.getMaterialOnGroundUses(groundItems);

    for i, con in ipairs(currentConsumableGroup) do
        local consumable = con.Consumable;
        local amount = con.Amount;
        local invItemUses = playerInv:getUsesTypeRecurse(consumable);

        if groundItemsUses[consumable] then
            for _, item in ipairs(groundItemsUses[consumable]) do
                invItemUses = invItemUses + item:getDrainableUsesInt();
            end
        end

        local isEnough = invItemUses >= amount
        local itemName = getItemNameFromFullType(consumable)
        local color = isEnough and BuildingMenu.ghs or BuildingMenu.bhs

        if not consumableFound and isEnough then
            consumableFound = true;
            consumableFoundIndex = i;
        end

        local consumableText = color .. itemName .. ' ' .. getText("ContextMenu_Uses") .. " " .. invItemUses .. "/" .. amount;
        if i > 1 then
            table.insert(consumablesBuffer, " <LINE> " .. color .. getText("ContextMenu_or") .. " ");
        end
        table.insert(consumablesBuffer, consumableText);
    end

    local consumablesText = table.concat(consumablesBuffer);

    if consumablesText ~= "" then
        tooltip.description = tooltip.description .. consumablesText .. ' <LINE>';
    else
        tooltip.description = tooltip.description .. BuildingMenu.bhs .. ' ERROR: No consumables found. <LINE>';
    end

    return consumableFound, consumableFoundIndex;
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
        local consumableCountsInfo = 0;
        for i, currentConsumableGroup in ipairs(objectRecipe.useConsumable) do
            local adaptedConsumableGroup = adaptRecipeGroupToNewFormat(currentConsumableGroup);
            currentResult, consumableCountsInfo = BuildingMenu.tooltipCheckForConsumable(
                playerObj,
                playerInv,
                adaptedConsumableGroup,
                tooltip
            );
            consumablesFoundIndexMatrix[i] = consumableCountsInfo;

            -- if isDebugEnabled() then print("====================================="); end
            -- BuildingMenu.debugPrint("[Building Menu Debug] consumablesFoundIndexMatrix ",consumablesFoundIndexMatrix);

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    if objectRecipe.neededMaterials then
        local materialCountsInfo = {};
        for i, currentMaterialGroup in ipairs(objectRecipe.neededMaterials) do
            local adaptedMaterialGroup = adaptRecipeGroupToNewFormat(currentMaterialGroup);
            currentResult, materialCountsInfo = BuildingMenu.tooltipCheckForMaterial(
                playerObj,
                playerInv,
                adaptedMaterialGroup,
                tooltip
            );
            materialFoundIndexMatrix[i] = materialCountsInfo;

            -- BuildingMenu.debugPrint("[Building Menu Debug] materialFoundIndexMatrix ",materialFoundIndexMatrix);
            -- if isDebugEnabled() then print("====================================="); end

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

    if ISBuildMenu.cheat then
        tooltip.description = "<LINE> <LINE> <RGB:1,0.8,0> Build Cheat Mode Active " .. tooltip.description;
        return tooltip, true, materialFoundIndexMatrix, consumablesFoundIndexMatrix;
    else
        return tooltip, canBuildResult, materialFoundIndexMatrix, consumablesFoundIndexMatrix;
    end
end

--- Returns the BuildingMenu instance.
---@return BuildingMenu
function getBuildingMenuInstance()
    return BuildingMenu
end