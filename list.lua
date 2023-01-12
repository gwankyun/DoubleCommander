-- array = { "a", "b", "c" }

-- answer = Dialogs.InputListBox("title", "msg", array, "a")

-- Dialogs.MessageBox(answer, "title", 0x0000)

local params = {...}
local path = params[1]

path = string.gsub(path, "\\", "/")

Clipbrd.SetAsText(path)

Dialogs.MessageBox(path, "title", 0x0000)
