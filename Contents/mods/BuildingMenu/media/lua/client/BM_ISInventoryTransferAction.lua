local RestrictedItemsManager = {};

RestrictedItemsManager.restrictedItemsRepository = {
    ["logs"] = {
        ["Base.TreeBranch"] = true,
        ["Base.Twigs"] = true,
        ["Base.Plank"] = true,
        ["Base.Log"] = true,
        ["Base.LogStacks2"] = true,
        ["Base.LogStacks3"] = true,
        ["Base.LogStacks4"] = true,
        ["Packing.10pkRopeBranch"] = true,
        ["Packing.5pkRopeBranch"] = true,
        ["Packing.10pkSheetRopeBranch"] = true,
        ["Packing.5pkSheetRopeBranch"] = true,
        ["Packing.10pkSheetRopePlank"] = true,
        ["Packing.5pkSheetRopePlank"] = true,
        ["Packing.10pkRopePlank"] = true,
        ["Packing.5pkRopePlank"] = true,
        ["A_Little_Handy.Stack_of_Planks"] = true,
    }
};

--- Check if item transfer is restricted
--- @param item InventoryItem
--- @param destContainer ItemContainer
--- @return boolean
function RestrictedItemsManager.isItemTransferRestricted(item, destContainer)
    local itemFullType = item:getFullType();
    local containerType = destContainer:getType();

    local sandboxEnabled = SandboxVars.BuildingMenu and SandboxVars.BuildingMenu[containerType .. "Restrictions"];

    if sandboxEnabled == true or sandboxEnabled == nil then
        local allowedItems = RestrictedItemsManager.restrictedItemsRepository[containerType];
        if allowedItems then
            local isAllowedItem = allowedItems[itemFullType] or false;
            if not isAllowedItem then return true; end
        end
    end

    return false;
end

--- Add a single restriction
--- @param containerType string
--- @param itemFullType string
function RestrictedItemsManager.addRestriction(containerType, itemFullType)
    RestrictedItemsManager.restrictedItemsRepository[containerType] =
        RestrictedItemsManager.restrictedItemsRepository[containerType] or {};
    RestrictedItemsManager.restrictedItemsRepository[containerType][itemFullType] = true;
end

--- Add multiple restrictions from a table
--- @param containerType string
--- @param itemFullTypes table
function RestrictedItemsManager.addRestrictions(containerType, itemFullTypes)
    RestrictedItemsManager.restrictedItemsRepository[containerType] =
        RestrictedItemsManager.restrictedItemsRepository[containerType] or {};

    for i = 1, #itemFullTypes do
        local itemFullType = itemFullTypes[i];
        RestrictedItemsManager.restrictedItemsRepository[containerType][itemFullType] = true;
    end
end

--- Remove a single restriction
--- @param containerType string
--- @param itemFullType string
function RestrictedItemsManager.removeRestriction(containerType, itemFullType)
    if RestrictedItemsManager.restrictedItemsRepository[containerType] and RestrictedItemsManager.restrictedItemsRepository[containerType][itemFullType] then
        RestrictedItemsManager.restrictedItemsRepository[containerType][itemFullType] = nil;
    end
end

RestrictedItemsManager.originalIsValid = ISInventoryTransferAction.isValid;
function ISInventoryTransferAction.isValid(self)
    if not self.item then return false; end
    if not self.destContainer then return false; end

    if RestrictedItemsManager.isItemTransferRestricted(self.item, self.destContainer) then return false; end

    return RestrictedItemsManager.originalIsValid(self);
end

return RestrictedItemsManager;
