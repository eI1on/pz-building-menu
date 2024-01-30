require "TimedActions/ISInventoryTransferAction"

local items = {"Plank", "Log", "LogStacks2", "LogStacks3", "LogStacks4"};
local function isLogItemTransferRestricted(item, destContainer)
    local itemType = item:getType();
    local isLogContainer = destContainer:getType() == "logs";
    local isRestrictedItem = false;

    -- check if the item type is in the restricted items list
    for _, restrictedType in ipairs(items) do
        if itemType == restrictedType then
            isRestrictedItem = true;
            break
        end
    end

    -- restrict transfer if the destination is a log container and the item is in the restricted list
    if isLogContainer and not isRestrictedItem then return true; end

    -- in all other cases, do not restrict
    return false
end

local originalIsValid = ISInventoryTransferAction.isValid
function ISInventoryTransferAction.isValid(self)
    if not self.item then return false; end
    if not self.destContainer then return false; end
    if isLogItemTransferRestricted(self.item, self.destContainer) then
        return false;
    end

    return originalIsValid(self)
end