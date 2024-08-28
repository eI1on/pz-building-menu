local Logger = require("BuildingMenu/Logger")
local BuildableLoader = require("BuildingMenu/BuildableLoader")

local function TestBuildableLoading()
    Logger:setLogLevel("DEBUG")

    BuildableLoader.loadFromMods()
    local buildableObjects = BuildableLoader.loadAllBuildables()
end

TestBuildableLoading()