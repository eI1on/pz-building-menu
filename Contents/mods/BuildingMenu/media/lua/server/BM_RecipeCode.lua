-- Give back the recipe result AND include the original roasting pan too
function ImprovisedGlass_GiveBackRoastingPan(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("Base.RoastingPan");
end

-- Give back a glass pane and the original responses
function ImprovisedGlass_GiveBackGlassPane(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("GlassPane");
end

-- Grant XP on Cooking Glass
function Recipe.OnGiveXP.ImprovisedGlass_XPMakeGlass(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 1);
end