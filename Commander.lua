local params = {...}
local path = params[1]
local file = params[2]

local function parent_path(path)
    local r = string.reverse(string.sub(path, 1))
    local b, _ = string.find(r, "\\")
    return string.reverse(string.sub(r, b))
end

local function dc_switch_panel()
    local is_left = DC.CurrentPanel()
    if is_left == 0 then
        DC.CurrentPanel(1)
    else
        DC.CurrentPanel(0)
    end
end

-- dc_switch_panel()

local function none_empty(str, value)
    if str == "" then
        return value
    else
        return str
    end
end

local function dc_sort(cmd)
    local order = ""
    if string.match(cmd, "^..a") then
        order = "ascending"
    elseif string.match(cmd, "^..d") then
        order = "descending"
    end

    local column = "name"
    if string.match(cmd, "^.n") then
        column = "name"
        order = none_empty(order, "ascending")
    elseif string.match(cmd, "^.e") then
        column = "ext"
        order = none_empty(order, "ascending")
    elseif string.match(cmd, "^.s") then
        column = "size"
    elseif string.match(cmd, "^.d") then
        column = "datetime"
    end

    order = none_empty(order, "descending")

    DC.ExecuteCommand("cm_UniversalSingleDirectSort", "column="..column, "order="..order)
    DC.ExecuteCommand("cm_GoToFirstFile")
end

local function dc_new_tab(path)
    DC.ExecuteCommand("cm_NewTab")
    DC.ExecuteCommand("cm_ActivateTabByIndex", "index=-1")
    if path ~= "" then
        DC.ExecuteCommand("cm_ChangeDir", "activepath="..path)
    end
end

local function dc_tab(cmd)
    if string.match(cmd, "^.p") then
        dc_new_tab(parent_path(path))
    end
end

-- local obj=io.popen("cd") --如果不在交互模式下，前面可以添加local
-- local current_path=obj:read("*all"):sub(1,-2) --path存放当前路径
-- obj:close() --关掉句柄

local function dc_panel(cmd, file)
    if #cmd == 1 then
        dc_switch_panel()
        DC.ExecuteCommand("cm_NewTab")
        dc_switch_panel()
        DC.ExecuteCommand("cm_Exchange")
        DC.ExecuteCommand("cm_CloseTab")
        dc_switch_panel()
    elseif string.match(cmd, "^.s") then
        if SysUtils.DirectoryExists(file) then
            dc_switch_panel()
            DC.ExecuteCommand("cm_NewTab")
            DC.ExecuteCommand("cm_ChangeDir", "activepath="..file)
        end
    end
end

-- local ButPressed = Dialogs.MessageBox(current_path, "Title", 0x0000)
-- if SysUtils.DirectoryExists(file) then
--     local ButPressed = Dialogs.MessageBox(file.."是目录", "Title", 0x0000)
-- else
--     local ButPressed = Dialogs.MessageBox(file.."是文件", "Title", 0x0000)
-- end

local bAck, sAnswer = Dialogs.InputQuery("命令", "請輸入", false, "")
if bAck then
    if string.match(sAnswer, "^s") then
        dc_sort(sAnswer)
    elseif string.match(sAnswer, "^t") then
        dc_tab(sAnswer)
    elseif string.match(sAnswer, "^p") then
        dc_panel(sAnswer, file)
    elseif string.match(sAnswer, "^d") then
        dc_new_tab("")
        DC.ExecuteCommand("cm_DirHotList", "menutype=popup", "position=cursor")
    end
end
