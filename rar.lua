local params = { ... }
local pt = params[1]
local fs = params[2]
local ps = params[3]

local function remove_double_quote(str)
    return str:sub(2, str:len() - 1)
end

local function cmd_in(cmd, cmd_list)
    for index, value in ipairs(cmd_list) do
        if cmd == value then
            return true
        end
    end
    return false
end

local function rar(ps, fs, pt)
    pt = remove_double_quote(pt)
    fs = remove_double_quote(fs)

    local file = string.format('"%s\\%s.rar"', pt, fs)

    local cmd = string.format('cd %s && winrar a %s "%s"', ps, file, fs)
    os.execute(cmd)
end

local function rar_x(ps, fs, pt)
    pt = remove_double_quote(pt)
    ps = remove_double_quote(ps)
    fs = remove_double_quote(fs)

    local file = string.format('"%s\\%s"', ps, fs)

    local cmd = string.format('cd "%s" && winrar x %s', pt, file)
    os.execute(cmd)
end

local tips = string.format('%s %s %s', ps, fs, pt)

local bAck, sAnswer = Dialogs.InputQuery("命令", tips, false, "")
if bAck then
    if cmd_in(sAnswer, { "rar", "winrar", "r" }) then
        rar(ps, fs, pt)
    elseif cmd_in(sAnswer, { "rx" }) then
        rar_x(ps, fs, pt)
    end
end
