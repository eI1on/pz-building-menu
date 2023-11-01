-- On Player Load, check their professions and if it matches
-- one we're expecting, add some free recipes to their character
function IGAddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();

    -- Adjust Engineers with Glass Smelting by Default
    if profession == "engineer" then
        player:learnRecipe("IGPrepareGlassShards");
        player:learnRecipe("IGUnprepareGlassShards");
        player:learnRecipe("IGRemoveGlassPane");
    end

    -- Construction worker knows how to smelt glass
    if profession == "constructionworker" then
        player:learnRecipe("IGPrepareGlassShards")
        player:learnRecipe("IGUnprepareGlassShards")
        player:learnRecipe("IGRemoveGlassPane")
    end
end

-- Character loads into the world
Events.OnCreatePlayer.Add(IGAddRecipesToExistingPlayers);