local params = {...}

local function last_parent(path)
    local rp = string.reverse(path)
    return string.reverse(string.sub(rp, 1, string.find(rp, '\\') - 1))
end

local function full_names()
    local backup = Clipbrd.GetAsText()
    DC.ExecuteCommand("cm_CopyFullNamesToClip")
    local path = Clipbrd.GetAsText()
    Clipbrd.SetAsText(backup)
    return path
end

if (#params >= 2) then
    local path = params[1]
    local title = params[2]
    if (string.len(path) == 0 or string.len(title) == 0) then
        path = full_names()
        title = last_parent(path)
    end
    local cmd = string.format('wt nt -d %s --title %s', path, title)
    os.execute(cmd)
end
