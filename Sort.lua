local params = {...}
local column = params[1]
local order = params[2]

-- 排序
DC.ExecuteCommand("cm_UniversalSingleDirectSort",
    "column="..column, "order="..order)
-- 跳轉到第一個文件
DC.ExecuteCommand("cm_GoToFirstFile")
