local u = require("utils.core")

local autocmds = {
  filetypes = {
    {"FileType", "gitcommit", "setlocal textwidth=72"},
    {"FileType", "python", "syntax keyword pythonDecorator True None False self"},
    {"BufNewFile,BufRead", "*.py", "setlocal softtabstop=4 shiftwidth=4 expandtab textwidth=79"},
    {"FileType", "python", [[let b:AutoPairs = AutoPairsDefine({"f'": "'", "r'": "'", "b'": "'"})]]},
    {"BufNewFile,BufRead", "*.jinja", "set syntax=htmljinja"},
    {"BufNewFile,BufRead", "*.mako", "set filetype=mako"},
    {"FileType", "javascript", "setlocal fen"},
    {"FileType", "javascript", "setlocal nocindent"},
    {"BufRead", "*.twig", "set syntax=html filetype=html"},
    {"FileType", "markdown", "setlocal shiftwidth=4 softtabstop=4 expandtab"},
    {"BufNewFile,BufRead", "*.md", "setlocal textwidth=80"},
    {"BufNewFile,BufReadPost", "*.md", "set filetype=markdown"},
    {"BufNewFile,BufRead", "*.rasi", "set filetype=css"},
    {"FileType", "go", "setlocal shiftwidth=4 softtabstop=4"},
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

vim.cmd("autocmd bufenter * if (winnr(\"$\") == 1 && exists(\"b:NERDTree\") && b:NERDTree.isTabTree()) | q | endif")
vim.cmd("autocmd FocusGained,BufEnter * checktime")
