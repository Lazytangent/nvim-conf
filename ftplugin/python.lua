vim.cmd("syntax keyword pythonDecorator True None False self")

vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 120

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!python %<cr>', { noremap = true })
