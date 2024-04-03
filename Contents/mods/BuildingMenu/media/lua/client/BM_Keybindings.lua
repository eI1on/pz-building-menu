---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");

local KEY_BM = {
    name = "BuildingMenu",
    key = Keyboard.KEY_SLASH,
};

if ModOptions and ModOptions.getInstance then
    local function BuildingMenuOnModOptionsApply(optionValues)
        local scaleMapping = {
            [1] = 0.5,
            [2] = 0.75,
            [3] = 1,
            [4] = 1.25,
            [5] = 1.5,
            [6] = 1.75,
            [7] = 2,
        };
        local selectedScaleIndex = optionValues.settings.options.icon_scale;
        BuildingMenu.icon_scale = scaleMapping[selectedScaleIndex] or 1;
        BuildingMenu.show_item_icons = optionValues.settings.options.show_item_icons;
    end

    local function BuildingMenuOnModOptionsApplyInGame(optionValues)
        BuildingMenuOnModOptionsApply(optionValues);
    end

    local SETTINGS = {
        options_data = {
            show_item_icons = {
                name = "IGUI_BuildingMenuUI_ShowItemIcons",
                tooltip = "IGUI_BuildingMenuUI_ShowItemIcons_ToolTip",
                default = true,
                OnApplyMainMenu = BuildingMenuOnModOptionsApply,
                OnApplyInGame = BuildingMenuOnModOptionsApplyInGame,
            },
            icon_scale = {
                "0.5",
                "0.75",
                "1",
                "1.25",
                "1.5",
                "1.75",
                "2",
                name = "IGUI_BuildingMenuUI_IconScale",
                tooltip = "IGUI_BuildingMenuUI_IconScale_ToolTip",
                default = 3,
                OnApplyMainMenu = BuildingMenuOnModOptionsApply,
                OnApplyInGame = BuildingMenuOnModOptionsApplyInGame,
            },
        },

        mod_id = 'BuildingMenu',
        mod_shortname = 'Building Menu',
        mod_fullname = 'Building Menu',
    };

    ModOptions:getInstance(SETTINGS);
    ModOptions:AddKeyBinding("[UI]", KEY_BM);
    ModOptions:loadFile();

    Events.OnGameBoot.Add(function() BuildingMenuOnModOptionsApplyInGame({ settings = SETTINGS }) end);
end

local function onKeyPressed(keynum)
    if not MainScreen.instance or not MainScreen.instance.inGame or MainScreen.instance:getIsVisible() then return; end
    local playerObj = getSpecificPlayer(0);
    if playerObj:getVehicle() then return; end

    if playerObj ~= nil then
        if keynum == KEY_BM.key then
            ISBuildingMenuUI:toggleBuildingMenuUI(playerObj);
        end
    end
end
Events.OnKeyPressed.Add(onKeyPressed);
