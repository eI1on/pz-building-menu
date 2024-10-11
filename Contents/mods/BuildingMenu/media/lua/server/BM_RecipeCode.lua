-- Give back the recipe result AND include the original roasting pan too
function BuildingMenu_GiveBackRoastingPan(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("Base.RoastingPan");
end

-- Give back a glass pane and the original responses
function BuildingMenu_GiveBackGlassPane(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("GlassPane");
end

-- Grant XP on Cooking Glass
function Recipe.OnGiveXP.BuildingMenu_XPMakeGlass(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 1);
end

-- Grant XP on Cooking Glass
function Recipe.OnGiveXP.BuildingMenu_XPMakeWindshieldCar(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 3);
end

-- Grant XP on Cooking Glass
function Recipe.OnGiveXP.BuildingMenu_XPMakeWindowCar(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 2);
end

if getActivatedMods():contains("Greenhouse") or getActivatedMods():contains("ImprovisedGlass") then
    local blockRecipes = {};
    blockRecipes["IGPrepareGlassShards"] = true;
    blockRecipes["IGUnprepareGlassShards"] = true;
    blockRecipes["IGRemoveGlassPane"] = true;

    local recipes = getScriptManager():getAllRecipes();
    for i = 1, recipes:size() do
        local recipe = recipes:get(i - 1);
        if blockRecipes[recipe:getOriginalname()] then
            recipe:setNeedToBeLearn(true);
            recipe:setIsHidden(true);
        end
    end
end
