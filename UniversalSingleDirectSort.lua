local params = {...}
-- local column = params[1]
-- local order = params[2]

-- -- 排序
-- DC.ExecuteCommand("cm_UniversalSingleDirectSort",
--     "column="..column, "order="..order)
-- -- 跳轉到第一個文件
-- DC.ExecuteCommand("cm_GoToFirstFile")

local function none_empty(str, value)
    if str == "" then
        return value
    else
        return str
    end
end

local function dc_sort(cmd)
    local order = ""
    -- local subcmd = string.sub(cmd, 2)
    if string.match(cmd, "^.a") then
        order = "ascending"
    elseif string.match(cmd, "^.d") then
        order = "descending"
    end

    local column = "name"
    if string.match(cmd, "^n") then
        column = "name"
        order = none_empty(order, "ascending")
    elseif string.match(cmd, "^e") then
        column = "ext"
        order = none_empty(order, "ascending")
    elseif string.match(cmd, "^s") then
        column = "size"
    elseif string.match(cmd, "^d") then
        column = "datetime"
    end

    order = none_empty(order, "descending")

    DC.ExecuteCommand("cm_UniversalSingleDirectSort", "column="..column, "order="..order)
    DC.ExecuteCommand("cm_GoToFirstFile")
end

local bAck, sAnswer = Dialogs.InputQuery("超級命令", "請輸入", false, "")
if bAck then
    dc_sort(sAnswer)
end
