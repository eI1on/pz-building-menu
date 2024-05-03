local BM_Utils = require("BM_Utils");

local RemovableWallVinesTiles = {
    "melos_tiles_gardencenter_vines",
    "melos_tiles_grapevines"
};

local methods = {};

local M = {}
setmetatable(M, {
    __index = function(t, k)
        if methods[k] then
            return methods[k]
        end
        return RemovableWallVinesTiles[k]
    end,
    __newindex = function(t, k, v)
        if not RemovableWallVinesTiles[k] and not methods[k] then
            print("[Building Menu ERROR] ", "[RemovableWallVinesTiles] Adding new keys is not allowed. Use the addTile method: " .. tostring(k) .. " " .. tostring(v));
        else
            RemovableWallVinesTiles[k] = v;
        end
    end
});

methods.getTiles = function()
    return RemovableWallVinesTiles;
end

methods.addTile = function(tile)
    if type(tile) == "string" then
        table.insert(RemovableWallVinesTiles, tile);
    elseif type(tile) == "table" then
        for _, v in ipairs(tile) do
            table.insert(RemovableWallVinesTiles, v);
        end
    else
        print("[Building Menu ERROR] ", "[RemovableWallVinesTiles] INVALID type. String or table expected: " .. tostring(tile));
    end
end

return M
