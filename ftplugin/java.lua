vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.makeprg = "javac %"

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!java -cp %:p:h %:t:r<cr>', { noremap = true })
