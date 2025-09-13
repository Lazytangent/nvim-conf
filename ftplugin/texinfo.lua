vim.opt_local.commentstring = '@c%s'
vim.opt_local.errorformat = '%f:%l: %tarning: %m,%f:%l: %m,%-G%.%#'

vim.opt_local.makeprg = "makeinfo --pdf % --output=" .. vim.fn.expand("%:p:h") .. "/" .. vim.fn.expand("%:t:r") .. ".pdf"

vim.api.nvim_buf_create_user_command(0, 'Make', "<cmd>!make<cr>", {})
