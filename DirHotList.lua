local params = {...}
local path = params[1]

-- local function parent_path(path)
--     local r = string.reverse(string.sub(path, 1))
--     local b, _ = string.find(r, "\\")
--     return string.reverse(string.sub(r, b))
-- end

-- 創建標簽
DC.ExecuteCommand("cm_NewTab")
-- 切換到那個標簽
-- DC.ExecuteCommand("cm_ActivateTabByIndex", "index=-1")
-- 跳轉到父目錄
-- DC.ExecuteCommand("cm_ChangeDir", "activepath=" .. parent_path(path))
DC.ExecuteCommand("cm_DirHotList", "menutype=popup", "position=cursor")
