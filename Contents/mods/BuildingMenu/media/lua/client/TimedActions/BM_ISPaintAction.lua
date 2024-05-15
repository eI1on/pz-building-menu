require("BuildingObjects/TimedActions/ISPaintAction")
local BM_Utils = require("BM_Utils");

local oldISPaintActionPerform = ISPaintAction.perform;

local spriteMap = {
    ["building_menu_01_0"] = "building_menu_01_24",
    ["building_menu_01_1"] = "building_menu_01_25",
    ["building_menu_01_8"] = "building_menu_01_24",
    ["building_menu_01_9"] = "building_menu_01_25"
};

--- Overrides the perform function of ISPaintAction to change the sprite of the thumpable based on its current sprite.
--- @param self ISPaintAction
function ISPaintAction:perform()
    local currentIsoSprite = self.thumpable:getSprite();
    local currentSpriteName = currentIsoSprite:getName();
    local newSpriteName = spriteMap[currentSpriteName];

    if newSpriteName then
        self.thumpable:setSpriteFromName(newSpriteName);
        BM_Utils.debugPrint("[Building Menu DEBUG] ", "currentSpriteName: " .. currentSpriteName .. " newSpriteName:" .. newSpriteName);
    end

    oldISPaintActionPerform(self);
end
