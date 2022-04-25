-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    require('vim.highlight').on_yank()
  end,
})

-- Remember cursor
vim.api.nvim_create_autocmd('BufReadPost', {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'gitcommit' | exe "normal! g'\"" | endif]],
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\s\+$//e]],
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\n\+\%$//e]],
})

-- Set terminal buffer defaults
vim.api.nvim_create_autocmd('TermOpen', {
  command = [[setlocal nonumber norelativenumber bufhidden="delete"]],
})

-- Set terminal buffer defaults
vim.api.nvim_create_autocmd('TermOpen', {
  command = "startinsert",
})

-- Update file if file has been updated outside of buffer
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter'}, {
  command = "checktime",
})

vim.api.nvim_create_autocmd('StdinReadPre', {
  command = [[let s:std_in=1]],
})
