if not isClient() then return print("WARN: Sandbox UIPatch available only for multiplayer.") end

---https://steamcommunity.com/sharedfiles/filedetails/?id=2894296454
local function ForcedSetY(self, y)
	self.y = y;
	if self.javaObject ~= nil then
		self.javaObject:setY(y);
	end
end

local old_createPanel = ISServerSandboxOptionsUI.createPanel
local function new_createPanel(self, ...)
	local old_setY = ISUIElement.setY
	ISUIElement.setY = ForcedSetY
	local status, panel = pcall(old_createPanel, self, ...)
	ISUIElement.setY = old_setY
	return panel
end
ISServerSandboxOptionsUI.createPanel = new_createPanel