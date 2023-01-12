local params = {...}
local path = params[1]

-- 替換分隔符
path = string.gsub(path, "\\", "/")

-- 複製到剪貼板
Clipbrd.SetAsText(path)
