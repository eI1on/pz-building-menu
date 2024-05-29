---@type function
local getText = getText
---@type function
local pairs = pairs
---@type function
local ipairs = ipairs
---@type function
local getTexture = getTexture
---@class PerkFactory
local PerkFactory = PerkFactory
---@type function
local getSpecificPlayer = getSpecificPlayer
---@type function
local getSprite = getSprite
---@type function
local getItemNameFromFullType = getItemNameFromFullType
---@type function
local type = type
---@type function
local instanceof = instanceof

local BM_Utils = require("BM_Utils");

--- BuildingMenu namespace
---@class BuildingMenu
local BuildingMenu = {};

---@type boolean
BuildingMenu.playerCanPlaster = false;

---@type string
BuildingMenu.textTooltipHeader = '<RGB:1,1,1> <BR>' .. getText('Tooltip_craft_Needs') .. ': <LINE> ';

---@type string
BuildingMenu.textCanRotate = getText("Tooltip_craft_pressToRotate",
    Keyboard.getKeyName(getCore():getKey("Rotate building")));

local goodHighlightedColor = getCore():getGoodHighlitedColor();
local badHighlightedColor = getCore():getBadHighlitedColor();

---@type string
BuildingMenu.ghsString = string.format("<RGB:%.4f,%.4f,%.4f>", goodHighlightedColor:getR(), goodHighlightedColor:getG(),
    goodHighlightedColor:getB());

---@type string
BuildingMenu.bhsString = string.format("<RGB:%.4f,%.4f,%.4f>", badHighlightedColor:getR(), badHighlightedColor:getG(),
    badHighlightedColor:getB());

---@type table
BuildingMenu.ghsTable = { goodHighlightedColor:getR(), goodHighlightedColor:getG(), goodHighlightedColor:getB() };

---@type table
BuildingMenu.bhsTable = { badHighlightedColor:getR(), badHighlightedColor:getG(), badHighlightedColor:getB() };

BuildingMenu.icon_scale = 1;
BuildingMenu.show_item_icons = true;


-- Tags: Screwdriver, CutPlant, DigPlow (eg: HandFork), Sledgehammer, ChopTree (eg: Axe), ClearAshes (eg: Broom), TakeDirt (eg: Shovel), Crowbar, Hammer, RemoveBarricade (eg: Claw Hammer)

--- Definitions of tools used in the building menu
---@type table<string, table>
BuildingMenu.Tools = {}
BuildingMenu.Tools = {
    Hammer = {
        types = {
            'Base.Hammer',
            'Base.HammerStone',
            'Base.BallPeenHammer',
            'Base.ClubHammer',
            'ToolsOfTheTrade.BrickHammer',     --Tools of the Trade
            'ToolsOfTheTrade.StubbyHammer',    --Tools of the Trade
            'MWPWeapons.oxnailhammer',         -- [Reworked] MWPWeapons
            'MWPWeapons.fatmaxbrickhammer',    -- [Reworked] MWPWeapons
            'MWPWeapons.m48tacticalwarhammer', -- [Reworked] MWPWeapons
        },
        tags = { 'Hammer' }
    },
    Sledgehammer = {
        types = {
            'Base.Sledgehammer',
            'Base.Sledgehammer2',
            'ToolsOfTheTrade.PoliceBreachingHammer',           --Tools of the Trade
            'ToolsOfTheTrade.RailwaySpikeHammer',              --Tools of the Trade
            'ToolsOfTheTrade.WarHammer',                       --Tools of the Trade
            'ToolsOfTheTrade.IndustrialBreachingHammer',       --Tools of the Trade
            'ToolsOfTheTrade.CoreHammer',                      --Tools of the Trade
            'ToolsOfTheTrade.RailroadHammer',                  --Tools of the Trade
            'ToolsOfTheTrade.RebarHammer',                     --Tools of the Trade
            'ToolsOfTheTrade.DefilerSledgehammer',             --Tools of the Trade
            'ToolsOfTheTrade.DespoilerSledgehammer',           --Tools of the Trade
            'SWeapons.SalvagedSledgehammer',                   -- Scrap Weapons
            'SWeapons.GearMace',                               -- Scrap Weapons
            'SWeapons.HugeScrapPickaxe',                       -- Scrap Weapons
            'MWPWeapons.roughneckgorillasledgehammer',         -- [Reworked] MWPWeapons
            'AuthenticZClothing.AuthenticTagillaSledgehammer', -- Authentic Z
            'KWP.StoneSledgehammer',                           -- Kwin's Melee Weapon Pack
        },
        tags = { 'Sledgehammer' }
    },
    Paintbrush = {
        types = { 'Base.Paintbrush' },
        tags = {}
    },
    Screwdriver = {
        types = {
            'Base.Screwdriver',
            'ToolsOfTheTrade.Multitool',      --Tools of the Trade
            'ToolsOfTheTrade.SpiffArmyKnife', --Tools of the Trade
        },
        tags = { 'Screwdriver' }
    },
    Saw = {
        types = {
            'Base.Saw',
            'Base.GardenSaw',
            'ToolsOfTheTrade.Backsaw',  -- Tools of the Trade
            'ToolsOfTheTrade.RyobaSaw', -- Tools of the Trade
        },
        tags = { 'Saw' }
    },
    HandShovel = {
        types = {
            'farming.HandShovel',
            'SOMW.SharpTrowel',
            'ToolsOfTheTrade.Adze', --Tools of the Trade
        },
        tags = {}                   --'DigPlow' > this includes shovels
    },
    Shovel = {
        types = {
            'Base.Shovel',
            'SOMW.EntrenchingShovel',            --SOMW
            'MWPWeapons.sptesnaztacticalshovel', -- [Reworked] MWPWeapons
            'ToolsOfTheTrade.TrenchShovel'       -- Tools of the Trade
        },
        tags = {}
    },
    BlowTorch = {
        types = { 'Base.BlowTorch' },
        tags = {}
    },
    WeldingMask = {
        types = {
            'Base.WeldingMask',
            'AuthenticZClothing.Hat_TagillaMask2', -- Authentic Z
            'AuthenticZClothing.Hat_TagillaMask',  -- Authentic Z
            'Base.Hat_WelderMask2'                 -- Scrap Armor
        },
        tags = { 'WeldingMask' }
    },
    Needle = {
        types = { 'Base.Needle' },
        tags = { 'SewingNeedle' }
    },
    Wrench = {
        types = {
            'Base.PipeWrench',
            'Base.Wrench'
        },
        tags = {}
    },
    Scissors = {
        types = {
            'Base.Scissors',
            'ToolsOfTheTrade.BandageScissors',
            'ToolsOfTheTrade.SpiffArmyKnife',
            'ToolsOfTheTrade.Multitool'
        },
        tags = { 'Scissors' }
    }
}


--- Definitions of materials used in the building menu
---@type table<string, table>
BuildingMenu.ItemsAlternatives = {};
BuildingMenu.ItemsAlternatives = {
    GlassPaneSmall = {
        "Base.GlassPane",
        "ImprovisedGlass.GlassPane",
        "filcher.SFGlassPanel",
        "Base.SmallGlassPanel",
        "damnCraft.GlassPaneSmall",
    },
    GlassPaneBig = {
        "Base.BigGlassPanel",
        "damnCraft.GlassPaneLarge",
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
    Ropes = {
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
            Item = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
            Multiplier = 1,
        },
        {
            Item = BuildingMenu.ItemsAlternatives.GlassPaneBig,
            Multiplier = 0.5,
        }
    }
};


--- Function called to fill the world object context menu
---@param playerNum number
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
BuildingMenu.OnFillWorldObjectContextMenu = function(playerNum, context, worldobjects, test)
    if getCore():getGameMode() == "LastStand" then return; end
    if test and ISWorldObjectContextMenu.Test then return true; end

    local playerObj = getSpecificPlayer(playerNum);

    if playerObj:getVehicle() then return; end


    if BuildingMenu.getPlayerSkills(playerObj)["Woodwork"] > 7 or ISBuildMenu.cheat then
        BuildingMenu.playerCanPlaster = true;
    else
        BuildingMenu.playerCanPlaster = false;
    end

    local option = context:insertOptionAfter(getText("ContextMenu_SitGround"), getText("ContextMenu_BuildingMenu"),
        worldobjects, function()
            ISBuildingMenuUI.openPanel(playerObj);
        end)
    option.iconTexture = getTexture("media/ui/building_menu.png");
end
Events.OnFillWorldObjectContextMenu.Add(BuildingMenu.OnFillWorldObjectContextMenu)


--- Gets the player's skills
---@param playerObj IsoPlayer
---@return table<string, number>
BuildingMenu.getPlayerSkills = function(playerObj)
    local skills = {};
    local perks = PerkFactory.PerkList;
    for i = 0, perks:size() - 1 do
        local perkID = perks:get(i):getId();
        skills[perkID] = playerObj:getPerkLevel(perks:get(i));
    end
    return skills;
end


--- Predicate function to check if an item is not broken
---@param item InventoryItem
---@return boolean
BuildingMenu.predicateNotBroken = function(item)
    return not item:isBroken();
end

--- Predicate function to check if an item has a specific tag
---@param item InventoryItem
---@param tag string
---@return boolean
BuildingMenu.predicateHasTag = function(item, tag)
    return not item:isBroken() and item:hasTag(tag);
end

--- Calculates the uses of a welding rod
---@param torchUses number
---@return number
BuildingMenu.weldingRodUses = function(torchUses)
    return math.floor((torchUses + 0.1) / 2);
end

--- Rounds a number to a specified number of decimal places
--- If `numDecimalPlaces` is not provided or less than 1, the number is rounded to the nearest integer
--- @param num number The number to round
--- @param numDecimalPlaces number|nil The number of decimal places to round to. Optional; if nil or less than 1, rounds to the nearest integer
--- @return number num The rounded number
BuildingMenu.round = function(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces > 0 then
        local multiplier = 10 ^ numDecimalPlaces;
        return math.floor(num * multiplier + 0.5) / multiplier;
    end

    local roundedNum = math.floor(num + 0.5);
    return math.max(roundedNum, 1);
end

--- Gets the display name of a moveable object
---@param sprite string
---@return string|nil
BuildingMenu.getMoveableDisplayName = function(sprite)
    local props = getSprite(sprite):getProperties();
    local hasCustomName = props:Is('CustomName');
    local hasGroupName = props:Is('GroupName');
    if not hasCustomName and not hasGroupName then return nil; end
    local name = "";
    if hasGroupName then
        name = props:Val('GroupName');
    end
    if hasCustomName then
        if name ~= "" then name = name .. " "; end
        name = name .. props:Val('CustomName');
    end
    return Translator.getMoveableDisplayName(name);
end

--- Checks if the player has a tool to build
---@param inv ItemContainer
---@return boolean
BuildingMenu.haveAToolToBuild = function(inv)
    local toolInfo = BuildingMenu.Tools['Hammer'];
    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            ---@diagnostic disable-next-line: param-type-mismatch
            if inv:containsTypeEvalRecurse(type, BuildingMenu.predicateNotBroken) then
                return true;
            end
        end
    end
    if toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            ---@diagnostic disable-next-line: param-type-mismatch
            if inv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, tag) end) then
                return true;
            end
        end
    end
    return false;
end

--- Gets the available tool from the inventory
---@param inv ItemContainer
---@param tool string
---@return InventoryItem|nil
BuildingMenu.getAvailableTool = function(inv, tool)
    local toolInfo = BuildingMenu.Tools[tool];
    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            ---@diagnostic disable-next-line: param-type-mismatch
            local item = inv:getBestTypeEvalRecurse(type, BuildingMenu.predicateNotBroken);
            if item then return item; end
        end
    end
    if toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            ---@diagnostic disable-next-line: param-type-mismatch
            local item = inv:getBestEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, tag) end,
                ---@diagnostic disable-next-line: param-type-mismatch
                function(item) return true end);
            if item then return item; end
        end
    end
    return nil;
end

--- Equips a primary tool for the player
---@param object any
---@param playerNum number
---@param tool string
---@return InventoryItem|nil
BuildingMenu.equipToolPrimary = function(object, playerNum, tool)
    local item = nil;
    local inv = getSpecificPlayer(playerNum):getInventory();
    item = BuildingMenu.getAvailableTool(inv, tool);
    if not item then return; end

    if instanceof(item, "Clothing") then
        if not item:isEquipped() then
            ISInventoryPaneContextMenu.wearItem(item, playerNum);
        end
    else
        ISInventoryPaneContextMenu.equipWeapon(item, true, item:isTwoHandWeapon(), playerNum);
    end
    return item;
end

--- Equips a secondary tool for the player
---@param object any
---@param playerNum number
---@param tool string
---@return InventoryItem|nil
BuildingMenu.equipToolSecondary = function(object, playerNum, tool)
    local item = nil;
    local inv = getSpecificPlayer(playerNum):getInventory();
    item = BuildingMenu.getAvailableTool(inv, tool);
    if not item then return; end

    if instanceof(item, "Clothing") then
        if not item:isEquipped() then
            ISInventoryPaneContextMenu.wearItem(item, playerNum);
        end
    else
        -- ISInventoryPaneContextMenu.equipWeapon(item, false, item:isTwoHandWeapon(), playerNum)
    end
    return item;
end


---@param id int
---@param icons ArrayList
---@return Texture|nil texture
local function loadTex(id, icons)
    if id >= 0 and id < icons:size() then
        return getTexture("Item_" .. tostring(icons:get(id)));
    end
    return nil;
end


---@param item Item
---@return Texture|nil
function BuildingMenu.getTexFromItem(item)
    if not item then
        print("[Building Menu WARNING] ", "Attempted to get texture name from a nil item.");
        return nil;
    end
    ---@type Texture|nil
    local texture = item:getNormalTexture();
    if not texture then
        ---@diagnostic disable-next-line: param-type-mismatch
        local obj = item:InstanceItem(nil);
        if obj then
            local icons = item:getIconsForTexture();
            if icons and icons:size() > 0 then
                texture = loadTex(obj:getVisual():getBaseTexture(), icons) or
                    loadTex(obj:getVisual():getTextureChoice(), icons);
            else
                texture = obj:getTexture();
            end
        end
    end
    return texture;
end

---@param item Item
---@return string|nil
function BuildingMenu.getTexNameFromItem(item)
    local texture = BuildingMenu.getTexFromItem(item);
    if texture then
        local textureName = texture:getName();
        local relativePath;
        if textureName:find("[\\/]+") then
            relativePath = textureName:match(".*(media[\\/].+)");
        else
            relativePath = textureName;
        end
        return relativePath;
    else
        print("[Building Menu WARNING] ", "Texture not found for item " .. item:getFullName());
        return nil;
    end
end

---@param itemFullType string
---@return Item|nil
function BuildingMenu.getItemInstance(itemFullType)
    BuildingMenu.ItemInstances = BuildingMenu.ItemInstances or {};
    local item = BuildingMenu.ItemInstances[itemFullType];

    if not item then
        item = getScriptManager():FindItem(itemFullType);
        if item then
            -- cache both the item instance and its texture name for quick access later
            local texNameOnly = BuildingMenu.getTexNameFromItem(item);
            BuildingMenu.ItemInstances[itemFullType] = { item = item, textureName = texNameOnly };
        end
    end
    return item and item.item or nil;
end

---@param item Item
---@return string|nil
function BuildingMenu.getTextureFromItem(item)
    if not item then return nil; end
    local cacheEntry = BuildingMenu.ItemInstances[item:getFullName()];
    if cacheEntry then
        return cacheEntry.textureName;
    end
    -- if for some reason the item wasn't cached, we fall back to extracting the texture name
    local texNameOnly = BuildingMenu.getTexNameFromItem(item)
    BuildingMenu.ItemInstances[item:getFullName()] = { item = item, textureName = texNameOnly }
    return texNameOnly
end

--- Tooltip check for a specific tool category
---@param playerInv ItemContainer
---@param tool string
---@return string, boolean, InventoryItem
BuildingMenu.tooltipCheckForTool = function(playerInv, tool)
    local toolInfo = BuildingMenu.Tools[tool];
    local found = false;
    local itemText = "";
    local itemInstance = nil;
    local currentInvItemTool = nil;
    ---@cast currentInvItemTool InventoryItem

    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            ---@type InventoryItem
            ---@diagnostic disable-next-line: param-type-mismatch
            local item = playerInv:getBestTypeEvalRecurse(type, BuildingMenu.predicateNotBroken);
            if item then
                itemText = itemText .. BuildingMenu.ghsString .. item:getName() .. ' <LINE>';
                itemInstance = item;
                currentInvItemTool = item;
                found = true;
                break;
            end
        end
    end

    if not found and toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            ---@diagnostic disable-next-line: param-type-mismatch
            local item = playerInv:getBestEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, tag) end,
                ---@diagnostic disable-next-line: param-type-mismatch
                function(item) return true end);
            if item then
                itemText = itemText .. BuildingMenu.ghsString .. item:getName() .. ' <LINE>';
                itemInstance = item;
                currentInvItemTool = item;
                found = true;
                break;
            end
        end
    end

    if not itemInstance then
        itemInstance = BuildingMenu.getItemInstance(toolInfo.types and toolInfo.types[1]);
    end

    if itemInstance then
        if instanceof(itemInstance, 'InventoryItem') then
            itemInstance = BuildingMenu.getItemInstance(itemInstance:getFullType());
        end
        local texNameOnly = BuildingMenu.getTextureFromItem(itemInstance);
        if texNameOnly and BuildingMenu.show_item_icons then
            itemText = "<IMAGE:" ..
                texNameOnly ..
                "," .. 20 * BuildingMenu.icon_scale .. "," .. 20 * BuildingMenu.icon_scale .. ">" .. itemText;
        end
    end

    if not found then
        local defaultItemName = (toolInfo.types and toolInfo.types[1] and getItemNameFromFullType(toolInfo.types[1])) or
            tool;
        itemText = itemText .. BuildingMenu.bhsString .. defaultItemName .. ' <LINE>';
        return itemText, false, currentInvItemTool;
    end
    return itemText, true, currentInvItemTool;
end


local function tooltipCheckForItem(playerObj, playerInv, currentItemGroup, tooltipDescription, groupType)
    local groupItemFound = false;
    local itemBuffer = {};
    local itemInfo = {};
    local groundItems = buildUtil.getMaterialOnGround(playerObj:getCurrentSquare());
    local groundItemCountMap = {};

    -- prepare ground item counts
    if groupType == "Consumable" then
        groundItemCountMap = buildUtil.getMaterialOnGroundUses(groundItems);
    else
        for groundItemType, itemsOnGround in pairs(groundItems) do
            groundItemCountMap[groundItemType] = #itemsOnGround;
        end
    end

    -- iterate over each alternative Material/Consumable group
    for altGroupIndex, altGroup in pairs(currentItemGroup) do
        local items = type(altGroup[groupType]) == "table" and altGroup[groupType] or { altGroup[groupType] };
        local totalAmountNeeded = altGroup.Amount;
        local totalFoundCount = 0;
        local itemDetails = {};
        local firstItemInstance = nil;

        -- iterate over each material Full Type within the alternative Material/Consumable group
        for _, itemFullType in pairs(items) do
            local item = BuildingMenu.getItemInstance(itemFullType);
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
                    itemCount = playerInv:getItemCountFromTypeRecurse(itemFullType) +
                        (groundItemCountMap[itemFullType] or 0);
                end

                totalFoundCount = totalFoundCount + itemCount;
                if itemCount > 0 and not firstItemInstance then
                    firstItemInstance = item;
                end
                if itemCount >= 0 then
                    itemDetails[itemFullType] = itemCount;
                end
            end
        end

        local itemFound = totalFoundCount >= totalAmountNeeded;
        local color = itemFound and BuildingMenu.ghsString or BuildingMenu.bhsString;
        groupItemFound = groupItemFound or itemFound;

        if not firstItemInstance then
            firstItemInstance = BuildingMenu.getItemInstance(items[1]);
        end

        if firstItemInstance then
            if instanceof(firstItemInstance, 'InventoryItem') then
                firstItemInstance = BuildingMenu.getItemInstance(firstItemInstance:getFullType());
            end
            ---@diagnostic disable-next-line: cast-local-type
            if totalFoundCount > 1000 then totalFoundCount = "Infinite"; end
            local itemText = color ..
                firstItemInstance:getDisplayName() ..
                ' ' ..
                (groupType == "Consumable" and getText("ContextMenu_Uses") .. " " or "") ..
                totalFoundCount .. '/' .. totalAmountNeeded;
            itemInfo[altGroupIndex] = {
                AmountNeeded = totalAmountNeeded,
                [groupType .. "Details"] = itemDetails
            };

            if altGroupIndex > 1 then
                table.insert(itemBuffer, " <LINE> <SETX:10> " .. color .. getText("ContextMenu_or") .. " ");
            end

            local texNameOnly = BuildingMenu.getTextureFromItem(firstItemInstance);
            if texNameOnly and BuildingMenu.show_item_icons then
                table.insert(itemBuffer,
                    "<IMAGE:" ..
                    texNameOnly .. "," .. 20 * BuildingMenu.icon_scale .. "," .. 20 * BuildingMenu.icon_scale .. "> "
                );
            end

            table.insert(itemBuffer, itemText);
        end
    end

    local itemText = table.concat(itemBuffer);
    tooltipDescription = itemText .. ' <LINE>';
    return tooltipDescription, groupItemFound, itemInfo;
end


--- Tooltip check for a specific material
---@param playerObj IsoPlayer
---@param playerInv ItemContainer
---@param currentMaterialsGroup table
---@param tooltipDescription string
---@return string, boolean, table
BuildingMenu.tooltipCheckForMaterial = function(playerObj, playerInv, currentMaterialsGroup, tooltipDescription)
    return tooltipCheckForItem(playerObj, playerInv, currentMaterialsGroup, tooltipDescription, "Material");
end


--- Tooltip check for a consumable item
---@param playerObj IsoPlayer
---@param playerInv ItemContainer
---@param currentConsumableGroup table
---@param tooltipDescription string
---@return string, boolean, table
BuildingMenu.tooltipCheckForConsumable = function(playerObj, playerInv, currentConsumableGroup, tooltipDescription)
    return tooltipCheckForItem(playerObj, playerInv, currentConsumableGroup, tooltipDescription, "Consumable");
end


local function adaptRecipeGroupToNewFormat(materialOrGroup)
    if materialOrGroup.Material or materialOrGroup.Consumable then
        return { materialOrGroup };
    elseif type(materialOrGroup[1]) == "table" and (materialOrGroup[1].Material or materialOrGroup[1].Consumable) then
        return materialOrGroup;
    end
end


--- Checks if the player can build a specific object. TOOPTIMIZE: optimize BuildingMenu.canBuildObject
---@param playerObj IsoPlayer
---@param tooltipDescription string
---@param objectRecipe table
---@return string, boolean, table, table, table
BuildingMenu.canBuildObject = function(playerObj, tooltipDescription, objectRecipe)
    local playerInv = playerObj:getInventory();

    tooltipDescription = BuildingMenu.textTooltipHeader;

    local canBuildResult = true;
    local currentResult = true;
    local consumablesFoundIndexMatrix = {};
    local materialFoundIndexMatrix = {};
    local toolFoundIndexMatrix = {};

    if not objectRecipe then
        tooltipDescription = tooltipDescription .. " <LINE>" .. BuildingMenu.bhsString .. " RECIPE IS NULL";
        return tooltipDescription, false, materialFoundIndexMatrix, consumablesFoundIndexMatrix, toolFoundIndexMatrix;
    end

    if objectRecipe.useConsumable then
        local consumablesGroupInfo = {};
        local consumableTooltipDescription = "";
        for i, currentConsumableGroup in ipairs(objectRecipe.useConsumable) do
            local adaptedConsumableGroup = adaptRecipeGroupToNewFormat(currentConsumableGroup);
            consumableTooltipDescription, currentResult, consumablesGroupInfo = BuildingMenu.tooltipCheckForConsumable(
                playerObj,
                playerInv,
                adaptedConsumableGroup,
                tooltipDescription
            );
            consumablesFoundIndexMatrix[i] = consumablesGroupInfo;
            tooltipDescription = tooltipDescription .. consumableTooltipDescription;

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    if objectRecipe.neededMaterials then
        local materialsGroupInfo = {};
        local materialTooltipDescription = "";
        for i, materialsGroup in ipairs(objectRecipe.neededMaterials) do
            local adaptedMaterialsGroup = adaptRecipeGroupToNewFormat(materialsGroup);
            materialTooltipDescription, currentResult, materialsGroupInfo = BuildingMenu.tooltipCheckForMaterial(
                playerObj,
                playerInv,
                adaptedMaterialsGroup,
                tooltipDescription
            );
            materialFoundIndexMatrix[i] = materialsGroupInfo;
            tooltipDescription = tooltipDescription .. materialTooltipDescription;

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    tooltipDescription = tooltipDescription .. " <LINE> ";

    if objectRecipe.neededTools then
        local currentInvItemTool = nil;
        local toolsTooltipDescription = "";
        for i, currentTool in ipairs(objectRecipe.neededTools) do
            toolsTooltipDescription, currentResult, currentInvItemTool = BuildingMenu.tooltipCheckForTool(
                playerInv,
                currentTool
            );
            toolFoundIndexMatrix[i] = { toolType = currentTool, invItem = currentInvItemTool };
            tooltipDescription = tooltipDescription .. toolsTooltipDescription;

            if not currentResult then
                canBuildResult = false;
            end
        end
    end

    tooltipDescription = tooltipDescription .. " <LINE> ";

    local playerSkills = BuildingMenu.getPlayerSkills(playerObj);
    if objectRecipe.skills then
        local skillsTooltipDescription = "";
        for _, skill in pairs(objectRecipe.skills) do
            if playerSkills[skill.Skill] < skill.Level then
                skillsTooltipDescription = BuildingMenu.bhsString ..
                    getText("IGUI_perks_" .. skill.Skill) ..
                    " " .. playerSkills[skill.Skill] .. "/" .. skill.Level .. " <LINE> ";
                canBuildResult = false;
            else
                skillsTooltipDescription = BuildingMenu.ghsString ..
                    getText("IGUI_perks_" .. skill.Skill) ..
                    " " .. playerSkills[skill.Skill] .. "/" .. skill.Level .. " <LINE> ";
            end
            tooltipDescription = tooltipDescription .. skillsTooltipDescription;
        end
    end

    -- BM_Utils.debugPrint("[Building Menu DEBUG] BuildingMenu.ItemInstances ", BuildingMenu.ItemInstances);
    -- BM_Utils.debugPrint("[Building Menu DEBUG] materialFoundIndexMatrix ", materialFoundIndexMatrix);
    -- BM_Utils.debugPrint("[Building Menu DEBUG] consumablesFoundIndexMatrix ", consumablesFoundIndexMatrix);
    -- BM_Utils.debugPrint("[Building Menu DEBUG] toolFoundIndexMatrix ", toolFoundIndexMatrix);

    if ISBuildMenu.cheat then
        tooltipDescription = "<LINE> <RGB:1,0.8,0> Build Cheat Mode Active " .. tooltipDescription;
        canBuildResult = true;
    end

    return tooltipDescription, canBuildResult, materialFoundIndexMatrix, consumablesFoundIndexMatrix,
        toolFoundIndexMatrix;
end

--- Returns the BuildingMenu instance
---@return BuildingMenu
return BuildingMenu
