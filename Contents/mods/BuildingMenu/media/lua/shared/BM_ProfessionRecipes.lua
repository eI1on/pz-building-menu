-- On Player Load, check their professions and if it matches
-- one we're expecting, add some free recipes to their character
function BMAddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();

    -- Adjust Engineers with Glass Smelting by Default
    if profession == "engineer" then
        player:learnRecipe("BMPrepareGlassShards");
        player:learnRecipe("BMUnprepareGlassShards");
        player:learnRecipe("BMRemoveGlassPane");
    end

    -- Construction worker knows how to smelt glass
    if profession == "constructionworker" then
        player:learnRecipe("BMPrepareGlassShards")
        player:learnRecipe("BMUnprepareGlassShards")
        player:learnRecipe("BMRemoveGlassPane")
    end
end

-- Character loads into the world
Events.OnCreatePlayer.Add(BMAddRecipesToExistingPlayers);