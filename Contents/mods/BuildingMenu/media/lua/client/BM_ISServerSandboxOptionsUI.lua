-- if not isClient() then return print("WARN: Sandbox UIPatch available only for multiplayer."); end

local function ForcedSetY(self, y)
    self.y = y;
    if self.javaObject ~= nil then
        self.javaObject:setY(y);
    end
end

local function overrideCreatePanel(UIObject)
    local old_createPanel = UIObject.createPanel;
    UIObject.createPanel = function(self, ...)
        local old_setY = ISUIElement.setY;
        ISUIElement.setY = ForcedSetY;
        local status, panel = pcall(old_createPanel, self, ...);
        ISUIElement.setY = old_setY;
        assert(status, "[Building Menu TWEAKS] Error while creating panel: " .. tostring(panel));
        return panel;
    end
end

Events.OnGameStart.Add(function()
    overrideCreatePanel(ISServerSandboxOptionsUI);
    if ISServerSandboxOptionsUIover then
        overrideCreatePanel(ISServerSandboxOptionsUIover);
    end
end)
