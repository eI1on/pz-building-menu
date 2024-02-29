local KEY_BM = {
	name = "BuildingMenu",
	key = Keyboard.KEY_SLASH,
};

if ModOptions and ModOptions.AddKeyBinding then
	ModOptions:AddKeyBinding("[UI]", KEY_BM);
end

local function onKeyPressed(keynum)
	local playerObj = getSpecificPlayer(0);
    if playerObj:getVehicle() then return; end

	if playerObj ~= nil then
		if keynum == KEY_BM.key then
            if ISBuildingMenuUI.instance == nil then
                local x = getCore():getScreenWidth()/1.5;
                local y = getCore():getScreenHeight()/7.5;
                ISBuildingMenuUI.openPanel(x, y, playerObj);
            else
                ISBuildingMenuUI.instance:close();
            end
		end
	end
end
Events.OnKeyPressed.Add(onKeyPressed);