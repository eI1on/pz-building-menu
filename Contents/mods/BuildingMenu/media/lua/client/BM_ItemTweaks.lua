--- Applies a parameter modification to a list of items.
--- @param items table A list of item IDs to which the parameter will be applied.
--- @param paramName string The name of the parameter to modify.
--- @param paramValue number The new value for the parameter.
local function applyParamToItems(items, paramName, paramValue)
    for _, itemID in ipairs(items) do
        local item = ScriptManager.instance:getItem(itemID)
        if item then
            item:DoParam(paramName .. " = " .. tostring(paramValue))
        end
    end
end

--- Computes the value of a parameter based on selected SandboxVars options.
--- @param optionVar string The key in SandboxVars table to look up the selected option.
--- @param optionValues table A table mapping option keys to their respective values.
--- @param defaultValue number The default value to use if the selected option is not found in the optionValues table.
--- @return number The computed parameter value.
local function computeUseDelta(optionVar, optionValues, defaultValue)
    local selectedOption = tostring(SandboxVars[optionVar])
    local uses = optionValues[selectedOption] or defaultValue  -- fallback to default value if the option is unrecognized
    return 1 / uses
end

local function tweakItems()
    local optionValues = {
        ["1"] = 4,
        ["2"] = 8,
        ["3"] = 10,
        ["4"] = 14,
        ["5"] = 18,
        ["6"] = 22,
        ["7"] = 26,
        ["8"] = 28,
    }

    local paintUseDelta = computeUseDelta("BuildingMenuRecipes.paintUses", optionValues, 10)
    local paintItems = {
        "PaintRed", "PaintBlack", "PaintBlue", "PaintBrown", "PaintCyan",
        "PaintGreen", "PaintGrey", "PaintLightBlue", "PaintLightBrown",
        "PaintOrange", "PaintPink", "PaintPurple", "PaintTurquoise",
        "PaintWhite", "PaintYellow"
    }
    applyParamToItems(paintItems, "UseDelta", paintUseDelta)


    local blowTorchUseDelta = computeUseDelta("BuildingMenuRecipes.blowTorchUses", optionValues, 10)
    applyParamToItems({"BlowTorch"}, "UseDelta", blowTorchUseDelta)

    
    local bucketOfAsphaltMixUseDelta = computeUseDelta("BuildingMenuRecipes.bucketAsphaltMixtureUses", optionValues, 10)
    applyParamToItems({"BucketAsphaltMixtureFull"}, "UseDelta", bucketOfAsphaltMixUseDelta)
 

    local bucketConcreteUseDelta = computeUseDelta("BuildingMenuRecipes.bucketConcreteUses", optionValues, 10)
    applyParamToItems({"BucketConcreteFull"}, "UseDelta", bucketConcreteUseDelta)
end

Events.OnInitGlobalModData.Add(tweakItems)
