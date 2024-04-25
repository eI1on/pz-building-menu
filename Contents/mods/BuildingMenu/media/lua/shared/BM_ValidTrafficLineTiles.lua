local BM_Utils = require("BM_Utils");

local RemovableTrafficLineTiles = {
    "street_trafficlines_01",
    "street_trafficlines_curb_white_full",
    "street_trafficlines_curb_yellow_full",
};


local methods = {};

local M = {}
setmetatable(M, {
    __index = function(t, k)
        if methods[k] then
            return methods[k]
        end
        return RemovableTrafficLineTiles[k]
    end,
    __newindex = function(t, k, v)
        if not RemovableTrafficLineTiles[k] and not methods[k] then
            BM_Utils.debugPrint("[Building Menu ERROR] ", "[RemovableTrafficLineTiles] Adding new keys is not allowed. Use the addTile method: " .. tostring(k) .. " " .. tostring(v));
        else
            RemovableTrafficLineTiles[k] = v;
        end
    end
});

methods.getTiles = function()
    return RemovableTrafficLineTiles;
end

methods.addTile = function(tile)
    if type(tile) == "string" then
        table.insert(RemovableTrafficLineTiles, tile);
    elseif type(tile) == "table" then
        for _, v in ipairs(tile) do
            table.insert(RemovableTrafficLineTiles, v);
        end
    else
        BM_Utils.debugPrint("[Building Menu ERROR] ", "[RemovableTrafficLineTiles] INVALID type. String or table expected: " .. tostring(tile));
    end
end

return M
