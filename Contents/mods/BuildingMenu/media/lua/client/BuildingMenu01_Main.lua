local getText = getText 
local pairs = pairs
local ipairs = ipairs
local PerkFactory = PerkFactory
local getSpecificPlayer = getSpecificPlayer
local getSprite = getSprite
local getItemNameFromFullType = getItemNameFromFullType


BuildingMenu = {}


BuildingMenu.playerCanPlaster = false
BuildingMenu.textTooltipHeader = '<RGB:1,1,1> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ' : <LINE> '
BuildingMenu.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))

-- Tags: Screwdriver, CutPlant, DigPlow (eg: HandFork), Sledgehammer, ChopTree (eg: Axe), ClearAshes (eg: Broom), TakeDirt (eg: Shovel), Crowbar, Hammer, RemoveBarricade (eg: Claw Hammer)
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



BuildingMenu.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
    if getCore():getGameMode() == "LastStand" then return end
    if test and ISWorldObjectContextMenu.Test then return true end

    local playerObj = getSpecificPlayer(player)

    if playerObj:getVehicle() then return end


    if BuildingMenu.getPlayerSkills(playerObj)["Woodwork"] > 7 or ISBuildMenu.cheat then
        BuildingMenu.playerCanPlaster = true
        else
        BuildingMenu.playerCanPlaster = false
    end

    local option = context:addOptionOnTop(getText("ContextMenu_BuildingMenu"), worldobjects, function()
        local x = getCore():getScreenWidth()/1.5;
        local y = getCore():getScreenHeight()/7.5;
        ISBuildingMenuUI.openPanel(x, y, playerObj);
    end)
    option.iconTexture = getTexture("media/ui/building_menu.png");

end
Events.OnFillWorldObjectContextMenu.Add(BuildingMenu.OnFillWorldObjectContextMenu)

BuildingMenu.getPlayerSkills = function(playerObj)
    local skills = {}
    local perks = PerkFactory.PerkList
    for i = 0, perks:size() - 1 do
        local perkID = perks:get(i):getId()
        skills[perkID] = playerObj:getPerkLevel(perks:get(i))
    end
    return skills
end

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


BuildingMenu.predicateNotBroken = function(item)
    return not item:isBroken()
end

BuildingMenu.predicateHasTag = function(item, tag)
    return not item:isBroken() and item:hasTag(tag)
end

BuildingMenu.weldingRodUses = function(torchUses)
    return math.floor((torchUses + 0.1) / 2)
end

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


BuildingMenu.equipToolPrimary = function(object, player, tool)
    local item = nil
    local inv = getSpecificPlayer(player):getInventory()
    item = BuildingMenu.getAvailableTool(inv, tool)
    if not item then return end
    if item then
        ISInventoryPaneContextMenu.equipWeapon(item, true, item:isTwoHandWeapon(), player)
        object.noNeedHammer = true
    end
end

BuildingMenu.equipToolSecondary = function(object, player, tool)
    local item = nil
    local inv = getSpecificPlayer(player):getInventory()
    item = BuildingMenu.getAvailableTool(inv, tool)
    if not item then return end
    if instanceof(item, "Clothing") then
        if not item:isEquipped() then
            ISInventoryPaneContextMenu.wearItem(item, player)
        end
    else
        -- ISInventoryPaneContextMenu.equipWeapon(item, false, item:isTwoHandWeapon(), player)
    end
end

BuildingMenu.tooltipCheckForTool = function(inv, tool, tooltip)
    local toolInfo = BuildingMenu.Tools[tool]
    local found = false

    if toolInfo.types then
        for _, type in ipairs(toolInfo.types) do
            local item = inv:getBestTypeEvalRecurse(type, BuildingMenu.predicateNotBroken)
            if item then
                tooltip.description = tooltip.description .. ISBuildMenu.ghs .. item:getName() .. ' <LINE>'
                found = true
                break
            end
        end
    end

    if not found and toolInfo.tags then
        for _, tag in ipairs(toolInfo.tags) do
            local item = inv:getBestEvalRecurse( function(item) return BuildingMenu.predicateHasTag(item, tag) end, function(item) return true end )
            if item then
                tooltip.description = tooltip.description .. ISBuildMenu.ghs .. item:getName() .. ' <LINE>'
                found = true
                break
            end
        end
    end

    if not found then
        tooltip.description = tooltip.description .. ISBuildMenu.bhs .. ((toolInfo.types and toolInfo.types[1] and getItemNameFromFullType(toolInfo.types[1])) or tool) .. ' <LINE>'
        return false
    end
    return true
end



BuildingMenu.tooltipCheckForMaterial = function(inv, material, amount, tooltip)
    local type = string.split(material, '\\.')[2]
    local invItemCount = 0

    local groundItems = buildUtil.getMaterialOnGround(getPlayer():getCurrentSquare())

    if amount > 0 then
        invItemCount = inv:getItemCountFromTypeRecurse(material)

        for groundItemType, groundItemCount in pairs(groundItems) do
            if groundItemType == type and groundItemCount ~= nil then
                invItemCount = invItemCount + #groundItemCount
            end
        end

        if invItemCount < amount then
            tooltip.description = tooltip.description .. ISBuildMenu.bhs .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
            return false
        else
            tooltip.description = tooltip.description .. ISBuildMenu.ghs .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
            return true
        end
    end
    tooltip.description = tooltip.description .. ISBuildMenu.bhs .. ' ERROR at tooltipCheckForMaterial' .. ' <LINE>'
end

BuildingMenu.tooltipCheckForConsumable = function(inv, material, amount, tooltip)
    
    local groundItems = buildUtil.getMaterialOnGround(getPlayer():getCurrentSquare())
    local groundItemsUses = buildUtil.getMaterialOnGroundUses(groundItems)
    local invItemUses = inv:getUsesTypeRecurse(material)

    local isEnough = invItemUses >= amount
    local text

    if material == "Base.BlowTorch" then
        local blowTorch = inv:getFirstTypeRecurse("Base.BlowTorch")
        local blowTorchUseLeft = (inv and inv:getUsesTypeRecurse("Base.BlowTorch")) or 0

        if groundItemsUses["Base.BlowTorch"] then
            blowTorchUseLeft = blowTorchUseLeft + groundItemsUses["Base.BlowTorch"]
            local maxUses = 0
            local blowTorchGround = nil
            for _, item2 in ipairs(groundItemsUses["Base.BlowTorch"]) do
                if item2:getDrainableUsesInt() > maxUses then
                    blowTorchGround = item2
                    maxUses = item2:getDrainableUsesInt()
                end
            end
            blowTorch = blowTorch or blowTorchGround
        end

        text = getItemNameFromFullType("Base.BlowTorch") .. " " ..
               getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. amount .. " <LINE> "
        isEnough = blowTorchUseLeft >= amount
    elseif material == "Base.WeldingRods" then
        -- local rodUse = BuildingMenu.weldingRodUses(amount)
        local rodUse = amount

        local weldingRods = 0
        weldingRods = invItemUses + (groundItemsUses["Base.WeldingRods"] or 0);
        text = getItemNameFromFullType("Base.WeldingRods") .. " " ..
                    getText("ContextMenu_Uses") .. " " .. weldingRods .. "/" .. rodUse .. " <LINE> "
        isEnough = weldingRods >= rodUse
    else
        if groundItemsUses[material] then
            invItemUses = invItemUses + groundItemsUses[material]
        end
        
        text = getItemNameFromFullType(material) .. " " ..
                    getText("ContextMenu_Uses") .. " " .. invItemUses .. "/" .. amount .. " <LINE> "
        isEnough = invItemUses >= amount
    end

    tooltip.description = tooltip.description .. (isEnough and ISBuildMenu.ghs or ISBuildMenu.bhs) .. text
    return isEnough
end


BuildingMenu.canBuildObject = function(playerObj, tooltip, objectRecipe)
    local playerInv = playerObj:getInventory()

    tooltip.description = BuildingMenu.textTooltipHeader;

    local _canBuildResult = true
    local _currentResult = true

    if objectRecipe.useConsumable then
        for _, _currentMaterial in pairs(objectRecipe.useConsumable) do
            if _currentMaterial['Consumable'] and _currentMaterial['Amount'] then
                _currentResult = BuildingMenu.tooltipCheckForConsumable(
                    playerInv,
                    _currentMaterial["Consumable"],
                    _currentMaterial["Amount"],
                    tooltip
                )
            else
                _canBuildResult = false
            end

            if not _currentResult then
                _canBuildResult = false
            end
        end
    end

    if objectRecipe.neededMaterials then
        for _, _currentMaterial in pairs(objectRecipe.neededMaterials) do
            if _currentMaterial['Material'] and _currentMaterial['Amount'] then
                _currentResult = BuildingMenu.tooltipCheckForMaterial(
                    playerInv,
                    _currentMaterial["Material"],
                    _currentMaterial["Amount"],
                    tooltip
                )
            else
                _canBuildResult = false
            end

            if not _currentResult then
                _canBuildResult = false
            end
        end
    end

    tooltip.description = tooltip.description .. " <LINE>"

    if objectRecipe.neededTools then
        for _, _currentTool in pairs(objectRecipe.neededTools) do
            _currentResult = BuildingMenu.tooltipCheckForTool(
                playerInv,
                _currentTool,
                tooltip
            )

            if not _currentResult then
                _canBuildResult = false
            end
        end
    end

    tooltip.description = tooltip.description .. " <LINE>"

    local playerSkills = BuildingMenu.getPlayerSkills(playerObj)
    if objectRecipe.skills then
        for _, skill in pairs(objectRecipe.skills) do
            if playerSkills[skill.Skill] < skill.Level then
                tooltip.description = tooltip.description .. ISBuildMenu.bhs .. getText("IGUI_perks_" .. skill.Skill)  .. " " .. playerSkills[skill.Skill] .. "/" .. skill.Level .. " <LINE>"
                _canBuildResult = false
            else
                tooltip.description = tooltip.description .. ISBuildMenu.ghs .. getText("IGUI_perks_" .. skill.Skill) .. " " .. playerSkills[skill.Skill] .. "/" .. skill.Level .. " <LINE>"
            end
        end
    end


    if ISBuildMenu.cheat then
        tooltip.description = "<LINE> <LINE> <RGB:1,0.8,0> Build Cheat mode active " .. tooltip.description .. BuildingMenu.textCanRotate;
        return tooltip, true
    else
        return tooltip, _canBuildResult
    end
end

function getBuildingMenuInstance()
    return BuildingMenu
end