local function setSpriteProperty(spriteName, propertyName, propertyValue, checkIsoFlagType)
    local props = getSprite(spriteName):getProperties();
    props:Set(propertyName, propertyValue, checkIsoFlagType);
end

local function toggleSpritesProperties()
    local sprites = {
        "pert_re-phoenix_2_120",
        "pert_re-phoenix_2_121",
        "pert_re-phoenix_2_122",
        "pert_re-phoenix_2_123",
        "pert_re-phoenix_2_124",
        "pert_re-phoenix_2_125",
        "pert_re-phoenix_2_126",
        "pert_re-phoenix_2_127"
    }

    for _, sprite in ipairs(sprites) do
        setSpriteProperty(sprite, "IsoType", "IsoTelevision", false);
        setSpriteProperty(sprite, "CustomItem", "Radio.TvMonster", false);
    end
end
Events.OnGameStart.Add(toggleSpritesProperties)
