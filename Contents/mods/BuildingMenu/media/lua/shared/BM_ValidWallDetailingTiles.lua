local BM_Utils = require("BM_Utils");

local RemovableWallDetailingTiles = {
    "walls_detailing_01",
    "walls_interior_detailing_01",
};


local methods = {};

local M = {}
setmetatable(M, {
    __index = function(t, k)
        if methods[k] then
            return methods[k]
        end
        return RemovableWallDetailingTiles[k]
    end,
    __newindex = function(t, k, v)
        if not RemovableWallDetailingTiles[k] and not methods[k] then
            print("[Building Menu ERROR] ", "[RemovableWallDetailingTiles] Adding new keys is not allowed. Use the addTile method: " .. tostring(k) .. " " .. tostring(v));
        else
            RemovableWallDetailingTiles[k] = v;
        end
    end
});

methods.getTiles = function()
    return RemovableWallDetailingTiles;
end

methods.addTile = function(tile)
    if type(tile) == "string" then
        table.insert(RemovableWallDetailingTiles, tile);
    elseif type(tile) == "table" then
        for _, v in ipairs(tile) do
            table.insert(RemovableWallDetailingTiles, v);
        end
    else
        print("[Building Menu ERROR] ", "[RemovableWallDetailingTiles] INVALID type. String or table expected: " .. tostring(tile));
    end
end

return M

