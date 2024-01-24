require"DebugUIs/BrushTool/BrushToolChooseTileUI"

local originalOnMouseDown = BrushToolTilePickerList.onMouseDown
function BrushToolTilePickerList:onMouseDown(x, y)
    if isDebugEnabled() then
        local c = math.floor(x / 64)
        local r = math.floor(y / 128)
        if c >= 0 and c < 8 and r >= 0 and r < 128 then
            if self.posToTileNameTable[r+1] ~= nil and self.posToTileNameTable[r+1][c+1] ~= nil then
                local tileName = self.posToTileNameTable[r+1][c+1]
                Clipboard.setClipboard(tileName)
                print(tileName)
            end
        end
    end
    originalOnMouseDown(self, x, y)
end
