local utils = require("mappings.utils")

vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
vim.keymap.set("n", "gl", utils.lua_require("leap-ast", "leap()"))
