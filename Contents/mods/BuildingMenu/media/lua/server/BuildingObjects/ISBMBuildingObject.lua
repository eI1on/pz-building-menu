require("BuildingObjects/ISBuildingObject")

--- Original onJoypadPressButton method from ISBuildingObject
--- @type fun(self:ISBuildingObject, joypadIndex:integer, joypadData:any, button:integer)
local originalOnJoypadPressButton = ISBuildingObject.onJoypadPressButton;

--- Handles joypad button press events specifically for the Building Menu UI
--- @param joypadIndex integer The index of the joypad
--- @param joypadData any Data associated with the joypad
--- @param button integer The button code that was pressed
function ISBuildingObject:onJoypadPressButton(joypadIndex, joypadData, button)
    ---@type ISBuildingMenuUI
    local BMUI = ISBuildingMenuUI.instance;
    -- If the B button is pressed and the Building Menu UI instance exists, set focus to it
    if button == Joypad.BButton and BMUI then
        setJoypadFocus(joypadData.player, BMUI);
    end
    -- Call the original method with the current context and passed parameters
    originalOnJoypadPressButton(self, joypadIndex, joypadData, button);
end
