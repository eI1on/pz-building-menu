require "DebugUIs/BrushTool/BrushToolChooseTileUI"
local BM_Logger = require("BM_Logger");
local BM_Utils = require("BM_Utils");

local originalOnMouseDown = BrushToolTilePickerList.onMouseDown
function BrushToolTilePickerList:onMouseDown(x, y)
    if isDebugEnabled() then
        local c = (x - (x % 64)) / 64;
        local r = (y - (y % 128)) / 128;
        if c >= 0 and c < 8 and r >= 0 and r < 128 then
            if self.posToTileNameTable[r + 1] ~= nil and self.posToTileNameTable[r + 1][c + 1] ~= nil then
                local tileName = self.posToTileNameTable[r + 1][c + 1];
                Clipboard.setClipboard(tileName);
                BM_Logger:info(tileName);
                BM_Utils.printPropNamesFromSprite(tileName);
            end
        end
    end
    originalOnMouseDown(self, x, y);
end
