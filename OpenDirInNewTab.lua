local params = {...}
local path = params[1]

-- DC.ExecuteCommand("cm_CloseTab") -- 關閉當前標簽
-- DC.ExecuteCommand("cm_ActivateTabByIndex", "index=-1", "side=inactive")
DC.ExecuteCommand("cm_OpenDirInNewTab")
-- DC.ExecuteCommand("cm_ChangeDir", "activepath=" .. path)
DC.ExecuteCommand("cm_ActivateTabByIndex", "index=-1")
