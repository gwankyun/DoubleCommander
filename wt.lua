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
    local color = ''

    if (string.len(path) == 0 or string.len(title) == 0) then
        path = full_names()
        title = last_parent(path)
    end

    if (string.find(path, 'SiYuan\\data')) then
        title = '思源'
        color = '#dc143c'
    elseif (string.find(path, 'sm18')) then
        color = '#ffff00'
    elseif (string.find(path, 'logseq')) then
        color = '#4682b4'
    elseif (string.find(path, 'CMake')) then
        color = '#00ff00'
    end

    local cmd = string.format('wt nt -d %s --title %s', path, title)
    if (string.len(color) > 0) then
        cmd = string.format('%s --tabColor %s', cmd, color)
    end
    os.execute(cmd)
end
