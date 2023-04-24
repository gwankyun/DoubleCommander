local cm = {}

function cm.new_tab()
    DC.ExecuteCommand("cm_NewTab")
end

function cm.change_dir(path)
    if path ~= "" then
        DC.ExecuteCommand("cm_ChangeDir", "activepath=" .. path)
    end
end

function cm.exchange()
    DC.ExecuteCommand("cm_Exchange")
end

function cm.close_tab()
    DC.ExecuteCommand("cm_CloseTab")
end

function cm.switch_panel()
    local is_left = DC.CurrentPanel()
    if is_left == 0 then
        DC.CurrentPanel(1)
    else
        DC.CurrentPanel(0)
    end
end

function cm.refresh()
    DC.ExecuteCommand("cm_Refresh")
end

function cm.get_as_text()
    local backup = Clipbrd.GetAsText()
    return backup
end

return cm
