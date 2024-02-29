local KEY_BM = {
	name = "BuildingMenu",
	key = Keyboard.KEY_SLASH,
};

if ModOptions and ModOptions.AddKeyBinding then
	ModOptions:AddKeyBinding("[UI]", KEY_BM);
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