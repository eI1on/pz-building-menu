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


BuildingMenu.Tools = {}
BuildingMenu.Tools['Hammer'] = {'Base.Hammer', 'Base.HammerStone', 'Base.BallPeenHammer', 'Base.WoodenMallet', 'Base.ClubHammer'}
BuildingMenu.Tools['Sledgehammer'] = {'Base.Sledgehammer', 'Base.Sledgehammer2'}
BuildingMenu.Tools['Paintbrush'] = {'Base.Paintbrush'}
BuildingMenu.Tools['Screwdriver'] = {'Base.Screwdriver'}
BuildingMenu.Tools['Saw'] = {'Base.Saw'}
BuildingMenu.Tools['HandShovel'] = {'farming.HandShovel'}
BuildingMenu.Tools['Shovel'] = {'Base.Shovel', 'Base.Shovel2'}
BuildingMenu.Tools['BlowTorch'] = {'Base.BlowTorch'}
BuildingMenu.Tools['WeldingMask'] = {'Base.WeldingMask'}
BuildingMenu.Tools['Needle'] = {'Base.Needle'}


BuildingMenu.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
    if getCore():getGameMode() == "LastStand" then return end
    if test and ISWorldObjectContextMenu.Test then return true end

    local playerObj = getSpecificPlayer(player)
    local inv = playerObj:getInventory()

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


local function predicateNotBroken(item)
    return not item:isBroken()
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
    local haveATool = nil
    for _, type in pairs (BuildingMenu.Tools['Hammer']) do
        haveATool = inv:containsTypeEvalRecurse(type, predicateNotBroken)
        if haveATool then
            haveATool = true
            break
        end
    end
    return haveATool
end

BuildingMenu.getAvailableTools = function(inv, tool)
    local tools = nil
    local toolsList = BuildingMenu.Tools[tool]
    for _, type in pairs(toolsList) do
        tools = inv:getBestTypeEvalRecurse(type, predicateNotBroken)
        if tools then return tools end
    end
end

BuildingMenu.equipToolPrimary = function(object, player, tool)
    local tools = nil
    local inv = getSpecificPlayer(player):getInventory()
    tools = BuildingMenu.getAvailableTools(inv, tool)
    if tools then
        ISInventoryPaneContextMenu.equipWeapon(tools, true, false, player)
        object.noNeedHammer = true
    end
end

BuildingMenu.equipToolSecondary = function(object, player, tool)
    local tools = nil
    local inv = getSpecificPlayer(player):getInventory()
    tools = BuildingMenu.getAvailableTools(inv, tool)
    if tools then
        ISInventoryPaneContextMenu.equipWeapon(tools, false, false, player)
    end
end

BuildingMenu.tooltipCheckForTool = function(inv, tool, tooltip)
    local tools = BuildingMenu.getAvailableTools(inv, tool)

    if tools then
        tooltip.description = tooltip.description .. ISBuildMenu.ghs .. tools:getName() .. ' <LINE>'
        return true
    else
        for _, type in pairs(BuildingMenu.Tools[tool]) do
            tooltip.description = tooltip.description .. ISBuildMenu.bhs .. getItemNameFromFullType(type) .. ' <LINE>'
            return false
        end
    end
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