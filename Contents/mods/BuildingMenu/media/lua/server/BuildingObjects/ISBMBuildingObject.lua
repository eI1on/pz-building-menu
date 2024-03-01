require("BuildingObjects/ISBuildingObject")


local originalOnJoypadPressButton = ISBuildingObject.onJoypadPressButton
function ISBuildingObject:onJoypadPressButton(joypadIndex, joypadData, button)
    local BMUI = ISBuildingMenuUI.instance
    if button == Joypad.BButton and BMUI then
        setJoypadFocus(joypadData.player, BMUI)
    end
    originalOnJoypadPressButton(self, joypadIndex, joypadData, button)
end