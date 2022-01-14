local params = {...}

local function none_empty(str, value)
    if str == "" then
        return value
    else
        return str
    end
end

local function dc_sort(cmd)
    local order = ""
    local reverse = false
    if string.match(cmd, "^.a") then
        order = "ascending"
    elseif string.match(cmd, "^.d") then
        order = "descending"
    elseif string.match(cmd, "^.r") then
        reverse = true
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
    if reverse then
        if order == "descending" then
            order = "ascending"
        else
            order = "descending"
        end
    end

    DC.ExecuteCommand("cm_UniversalSingleDirectSort", "column="..column, "order="..order)
    DC.ExecuteCommand("cm_GoToFirstFile")
end

local bAck, sAnswer = Dialogs.InputQuery("排序", "排序方式（d：由新至舊 e：拓展名 n：文件名 s：由大至小，後加r倒序）", false, "")
if bAck then
    dc_sort(sAnswer)
end
