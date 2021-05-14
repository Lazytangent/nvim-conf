local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Basics
u.map("n", "<leader>w", ":w<cr>")
