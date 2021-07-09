local u = require("utils.core")

local autocmds = {
  filetypes = {
    {"FileType", "gitcommit", "setlocal textwidth=72"},
    {"FileType", "gitcommit", [[1 | startinsert]]},
    {"BufNewFile,BufRead", "*.jinja", "set syntax=htmljinja"},
    {"BufNewFile,BufRead", "*.mako", "set filetype=mako"},
    {"FileType", "python", "syntax keyword pythonDecorator True None False self"},
    {"FileType", "python", [[let b:AutoPairs = AutoPairsDefine({"f'": "'", "r'": "'", "b'": "'"})]]},
    {"BufNewFile,BufRead", "*.py", "setlocal softtabstop=4 shiftwidth=4 expandtab textwidth=79"},

    {"FileType", "javascript", "setlocal fen"},
    {"FileType", "javascript", "setlocal nocindent"},

    {"BufRead", "*.twig", "set syntax=html filetype=html"},

    {"FileType", "markdown", "setlocal shiftwidth=4 softtabstop=4 expandtab"},
    {"BufNewFile,BufRead", "*.md", "setlocal textwidth=80"},
    {"BufNewFile,BufReadPost", "*.md", "set filetype=markdown"},

    {"BufNewFile,BufRead", "*.rasi", "set filetype=css"},

    {"FileType", "go", "setlocal shiftwidth=4 softtabstop=4"},
    {"BufNewFile,BufRead", "*.zshrc", "set filetype=zsh"},
  },
  hl_yank = {
    {"TextYankPost", "*", 'lua require"vim.highlight".on_yank()'},
  },
  preserve_cursor = {
    {"BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]},
  },
  trim_whitespaces = {
    {"BufWritePre", "*", [[%s/\s\+$//e]]},
    {"BufWritePre", "*", [[%s/\n\+\%$//e]]},
    -- {"BufWritePre", "*.[ch]", [[*.[ch] %s/\%$/\r/e]]},
  },
}

u.define_augroups(autocmds)

vim.cmd("autocmd FocusGained,BufEnter * checktime")
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
-- vim.cmd("highlight ColorColumn ctermbg=magenta")
-- vim.cmd("call matchadd('ColorColumn', '%81v', 100)")
-- vim.fn.matchadd('ColorColumn', '%81v', 100)
