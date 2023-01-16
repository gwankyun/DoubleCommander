DC.ExecuteCommand("cm_copyfullnamestoclip")
path = Clipbrd.GetAsText()

-- 替換分隔符
path = string.gsub(path, "\\", "/")

-- 複製到剪貼板
Clipbrd.SetAsText(path)
