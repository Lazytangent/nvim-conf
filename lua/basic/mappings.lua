local u = require("utils.core")

-- Command Line
u.map("c", "<C-A>", "<Home>", { noremap = true })
u.map("c", "<C-E>", "<End>",  { noremap = true })
u.map("c", "<C-K>", "<C-U>",  { noremap = true })
u.map("c", "<C-P>", "<Up>",   { noremap = true })
u.map("c", "<C-N>", "<Down>", { noremap = true })
