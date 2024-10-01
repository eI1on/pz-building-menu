require "TimedActions/ISInventoryTransferAction"

local restrictedItems = {
    TreeBranch = true, Twigs = true, Plank = true, Log = true, LogStacks2 = true, LogStacks3 = true, LogStacks4 = true,
    ["10pkRopeBranch"] = true, ["5pkRopeBranch"] = true, ["10pkSheetRopeBranch"] = true, ["5pkSheetRopeBranch"] = true, 
    ["10pkSheetRopePlank"] = true, ["5pkSheetRopePlank"] = true, ["10pkRopePlank"] = true, ["5pkRopePlank"] = true
};

local function isLogItemTransferRestricted(item, destContainer)
    local itemType = item:getType();
    local isLogContainer = destContainer:getType() == "logs";
    local isRestrictedItem = restrictedItems[itemType] or false;

    -- restrict transfer if the destination is a log container and the item is in the restricted list
    if isLogContainer and not isRestrictedItem then return true; end

    -- in all other cases, do not restrict
    return false;
end

local originalIsValid = ISInventoryTransferAction.isValid
function ISInventoryTransferAction.isValid(self)
    if not self.item then return false; end
    if not self.destContainer then return false; end
    if isLogItemTransferRestricted(self.item, self.destContainer) then return false; end

    return originalIsValid(self);
end
