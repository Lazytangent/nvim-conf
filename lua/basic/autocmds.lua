local u = require("utils.core")

local autocmds = {
  hl_yank = {
    {"TextYankPost", "*", 'lua require"vim.highlight".on_yank()'},
  },
  preserve_cursor = {
    {"BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'gitcommit' | exe "normal! g'\"" | endif]]},
  },
  trim_whitespaces = {
    {"BufWritePre", "*", [[%s/\s\+$//e]]},
    {"BufWritePre", "*", [[%s/\n\+\%$//e]]},
    -- {"BufWritePre", "*.[ch]", [[*.[ch] %s/\%$/\r/e]]},
  },
  terminal = {
    {"TermOpen", "*", [[setlocal nonumber norelativenumber bufhidden="delete"]]},
  },
}

u.define_augroups(autocmds)

vim.cmd("autocmd FocusGained,BufEnter * checktime")
vim.cmd([[ autocmd StdinReadPre * let s:std_in=1 ]])
-- autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
-- vim.cmd([[
--   autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
-- ]])
-- vim.cmd([[
--   autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
-- ]])
-- vim.cmd("highlight ColorColumn ctermbg=magenta")
-- vim.cmd("call matchadd('ColorColumn', '%81v', 100)")
-- vim.fn.matchadd('ColorColumn', '%81v', 100)
-- gitcommit = {
  -- {"FileType", "gitcommit", [[setlocal spell]]}
-- }
