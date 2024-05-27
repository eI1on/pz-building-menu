require "Definitions/ContainerButtonIcons"

do
    local textures = {
        clothingrack = "media/ui/Container_Clothingrack.png",
    }

    for key, path in pairs(textures) do
        ContainerButtonIcons[key] = getTexture(path)
    end
end