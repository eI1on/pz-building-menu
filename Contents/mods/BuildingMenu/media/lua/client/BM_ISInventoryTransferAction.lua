require "TimedActions/ISInventoryTransferAction"


local function isLogItemTransferRestricted(item, destContainer)
    local isLog = item:getType() == "Log"
    local isLogContainer = destContainer:getType() == "logs"

    -- if the destination is a log container and the item is not a log, restrict
    if isLogContainer and not isLog then
        return true
    end

    -- in all other cases, do not restrict
    return false
end

local originalIsValid = ISInventoryTransferAction.isValid
function ISInventoryTransferAction.isValid(self)
    if not self.item then return false; end
    if not self.destContainer then return false; end
    if isLogItemTransferRestricted(self.item, self.destContainer) then
        return false
    end

    return originalIsValid(self)
end