local params = {...}
local path = params[1]
local cm = require("cm")

local function parent_path(path)
    local r = string.reverse(string.sub(path, 1))
    local be = string.find(r, "\\")
    if be == nil then
        return ""
    else
        local b, _ = be
        return string.reverse(string.sub(r, b))
    end
end

local parent = parent_path(path)
if parent ~= "" then
    -- 創建標簽
    cm.new_tab()
    -- 跳轉到父目錄
    cm.change_dir(parent_path(path))
end
