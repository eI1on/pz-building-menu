local function setSpriteProperty(spriteName, propertyName, propertyValue, checkIsoFlagType)
    local props = getSprite(spriteName):getProperties();
    if not props then return end
    props:Set(propertyName, propertyValue, checkIsoFlagType);
end
local function unSetSpriteProperty(spriteName, propertyName)
    local props = getSprite(spriteName):getProperties();
    if not props then return end
    props:UnSet(propertyName);
end


local function toggleSpritesProperties()
    local sprites = {
        "location_military_generic_01_23",
        "location_military_generic_01_22",
        "location_military_generic_01_30",
        "location_military_generic_01_31",
    }

    for _, sprite in ipairs(sprites) do
        setSpriteProperty(sprite, "ContainerCapacity", "100", false);
    end
end
Events.OnGameStart.Add(toggleSpritesProperties)
