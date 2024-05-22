local BM_Utils = require('BM_Utils')

Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "Chinatown_EX_generic_1_40",
        "Chinatown_EX_generic_1_41",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false)
        BM_Utils.setSpriteProperty(props, "IsStackable", "", false)
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "25", false)
        BM_Utils.setSpriteProperty(props, "IsTable", "", false)
        BM_Utils.setSpriteProperty(props, "Surface", "12", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "smallcrate", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "25", false)
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        props:CreateKeySet()
    end
    sprites = {
        "Chinatown_EX_generic_1_42",
        "Chinatown_EX_generic_1_43",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false)
        BM_Utils.setSpriteProperty(props, "IsStackable", "", false)
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "35", false)
        BM_Utils.setSpriteProperty(props, "IsTable", "", false)
        BM_Utils.setSpriteProperty(props, "Surface", "16", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "smallcrate", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "40", false)
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        props:CreateKeySet()
    end


    sprites = {
        "Industry_1_8",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false)
        BM_Utils.setSpriteProperty(props, "IsStackable", "", false)
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "45", false)
        BM_Utils.setSpriteProperty(props, "IsTable", "", false)
        BM_Utils.setSpriteProperty(props, "Surface", "28", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "smallcrate", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "40", false)
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        BM_Utils.unsetSpriteProperty(props, "IsLow")
        props:CreateKeySet()
    end
    sprites = {
        "Industry_1_9",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false)
        BM_Utils.setSpriteProperty(props, "IsStackable", "", false)
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "25", false)
        BM_Utils.setSpriteProperty(props, "IsTable", "", false)
        BM_Utils.setSpriteProperty(props, "Surface", "16", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "smallcrate", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "25", false)
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        BM_Utils.unsetSpriteProperty(props, "IsLow")
        props:CreateKeySet()
    end
end)
