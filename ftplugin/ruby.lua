vim.wo.spell = false
vim.opt_local.suffixesadd:append({ ".rb" })

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!ruby %<cr>', { noremap = true })
