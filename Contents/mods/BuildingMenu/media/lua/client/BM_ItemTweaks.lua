local BM_Utils = require("BM_Utils")

--- Applies a parameter modification to a list of items.
--- @param items table A list of item IDs to which the parameter will be applied.
--- @param paramName string The name of the parameter to modify.
--- @param paramValue number The new value for the parameter.
local function applyParamToItems(items, paramName, paramValue)
    for _, itemID in ipairs(items) do
        local item = ScriptManager.instance:getItem(itemID);
        if item then
            item:DoParam(paramName .. " = " .. tostring(paramValue));
            BM_Utils.debugPrint("[Building Menu TWEAKS] ", " itemID:" .. itemID .. " paramName:" .. paramName .. " paramValue:" .. paramValue);
        else
            BM_Utils.debugPrint("[Building Menu ERROR] ", " INVALID itemID:" .. itemID .. " paramName:" .. paramName .. " paramValue:" .. paramValue);
        end
    end
end

--- Computes the value of a parameter based on selected SandboxVars options.
--- @param optionVar number The selected option in SandboxVars table to look up in the mapped table.
--- @param optionValues table A table mapping option keys to their respective values.
--- @return integer number The computed parameter value.
local function computeUseDelta(optionVar, optionValues)
    local selectedOption = tostring(optionVar);
    local uses = optionValues[selectedOption];
    -- BM_Utils.debugPrint("[Building Menu TWEAKS] optionVar:"..optionVar);
    -- BM_Utils.debugPrint("[Building Menu TWEAKS] uses:"..uses);
    return 1 / uses;
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
        ["8"] = 30,
        ["9"] = 45,
        ["10"] = 60,
        ["11"] = 80,
        ["12"] = 100,
    };


    local paintUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.paintUses or 3), optionValues);
    local paintItems = {
        "PaintRed", "PaintBlack", "PaintBlue", "PaintBrown", "PaintCyan",
        "PaintGreen", "PaintGrey", "PaintLightBlue", "PaintLightBrown",
        "PaintOrange", "PaintPink", "PaintPurple", "PaintTurquoise",
        "PaintWhite", "PaintYellow"
    };
    applyParamToItems(paintItems, "UseDelta", paintUseDelta);


    local blowTorchUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.blowTorchUses or 3), optionValues);
    applyParamToItems({ "BlowTorch" }, "UseDelta", blowTorchUseDelta);


    local bucketOfAsphaltMixUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.bucketAsphaltMixtureUses or 3), optionValues);
    applyParamToItems({ "BucketAsphaltMixtureFull" }, "UseDelta", bucketOfAsphaltMixUseDelta);


    local bucketConcreteUseDelta = computeUseDelta((SandboxVars.BuildingMenuRecipes.bucketConcreteUses or 3), optionValues);
    applyParamToItems({ "BucketConcreteFull" }, "UseDelta", bucketConcreteUseDelta);
end
Events.OnInitGlobalModData.Add(tweakItems)
