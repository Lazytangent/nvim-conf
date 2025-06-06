vim.opt_local.suffixesadd:append({ '.js', '.jsx', '.css' })
vim.opt_local.foldenable = true
vim.opt_local.cindent = false

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!node %<cr>', { noremap = true })
