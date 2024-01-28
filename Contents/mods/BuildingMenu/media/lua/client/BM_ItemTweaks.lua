--- Applies a parameter modification to a list of items.
--- @param items table A list of item IDs to which the parameter will be applied.
--- @param paramName string The name of the parameter to modify.
--- @param paramValue number The new value for the parameter.
local function applyParamToItems(items, paramName, paramValue)
    for _, itemID in ipairs(items) do
        local item = ScriptManager.instance:getItem(itemID)
        if item then
            item:DoParam(paramName .. " = " .. tostring(paramValue))
            -- print("[BM_Tweaks] itemID:"..itemID.." paramName:" ..paramName .. " paramValue:"..paramValue);
        else            
            print("[BM_Tweaks] NOT EXISTING itemID:"..itemID.." paramName:" ..paramName .. " paramValue:"..paramValue);
        end
    end
end

--- Computes the value of a parameter based on selected SandboxVars options.
--- @param optionVar number The key in SandboxVars table to look up the selected option.
--- @param optionValues table A table mapping option keys to their respective values.
--- @param defaultValue number The default value to use if the selected option is not found in the optionValues table.
--- @return number The computed parameter value.
local function computeUseDelta(optionVar, optionValues)
    local selectedOption = tostring(optionVar)
    local uses = optionValues[selectedOption]
    -- print("[BM_Tweaks] optionVar:"..optionVar);
    -- print("[BM_Tweaks] uses:"..uses);
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

    local paintUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.paintUses or 10), optionValues)
    local paintItems = {
        "PaintRed", "PaintBlack", "PaintBlue", "PaintBrown", "PaintCyan",
        "PaintGreen", "PaintGrey", "PaintLightBlue", "PaintLightBrown",
        "PaintOrange", "PaintPink", "PaintPurple", "PaintTurquoise",
        "PaintWhite", "PaintYellow"
    }
    applyParamToItems(paintItems, "UseDelta", paintUseDelta)


    local blowTorchUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.blowTorchUses or 10), optionValues)
    applyParamToItems({"BlowTorch"}, "UseDelta", blowTorchUseDelta)


    local bucketOfAsphaltMixUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.bucketAsphaltMixtureUses or 10), optionValues)
    applyParamToItems({"BucketAsphaltMixtureFull"}, "UseDelta", bucketOfAsphaltMixUseDelta)


    local bucketConcreteUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.bucketConcreteUses or 10), optionValues)
    applyParamToItems({"BucketConcreteFull"}, "UseDelta", bucketConcreteUseDelta)
end

Events.OnInitGlobalModData.Add(tweakItems)
