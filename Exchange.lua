local params = {...}
local column = params[1]
local order = params[2]

local function dc_switch_panel()
    local is_left = DC.CurrentPanel()
    if is_left == 0 then
        DC.CurrentPanel(1)
    else
        DC.CurrentPanel(0)
    end
end

dc_switch_panel()
DC.ExecuteCommand("cm_NewTab")
dc_switch_panel()
DC.ExecuteCommand("cm_Exchange")
DC.ExecuteCommand("cm_CloseTab")
dc_switch_panel()
