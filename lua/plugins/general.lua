-- Set up Lua plugins
require("trouble").setup {}
require("lsp-colors").setup {}
require("lualine").setup {
  options = {
    theme = "nightfly",
  },
  sections = {
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff'},
    lualine_z = {'location', {'diagnostics', sources = {'nvim_lsp' ,'coc', 'ale'}, sections = {'error', 'warn', 'info'}}},
  },
}

require('indent_blankline').setup {}

-- Variables
--------------------------------------------------------------------------------

-- Indent-Blankline
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false

-- Vim-Instant-Markdown
vim.g.instant_markdown_autostart = 0
vim.g.instant_markdown_slow = 0
vim.g.instant_markdown_open_to_the_world = 1
vim.g.instant_markdown_autoscroll = 1

-- Drag Visuals
vim.g.DVB_TrimWS = 1

-- NERDTree
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {'.pyc$', '__pycache__'}
vim.g.NERDTreeStatusLink = ""

-- Vim-Markdown
vim.g.vim_markdown_fenced_languages = {
  'html', 'python', 'css', 'javascript',
  'js=javascript', 'json=javascript', 'sass',
  'viml=vim', 'vim', 'bash=sh',
}

-- Vim-Ale
vim.g.ale_disable_lsp = 1
vim.g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = { 'prettier', 'eslint' },
  python = { 'autopep8', 'yapf' },
  typescript = { 'prettier', 'eslint' },
}
vim.g.ale_change_sign_column_color = 1

-- Vim-Coc
vim.g.coc_global_extensions = {
  "coc-emmet", "coc-css", "coc-html", "coc-json", "coc-prettier",
  "coc-tsserver", "coc-git", "coc-pyright", "coc-sql", "coc-sh",
  "coc-yank", "coc-vimlsp", "coc-jedi", "coc-clangd", "coc-go",
  "coc-yaml", "coc-toml", "coc-texlab", "coc-tailwindcss",
  "coc-omnisharp", "coc-prisma",
}

-- FZF
vim.g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-s"] = "split",
  ["ctrl-v"] = "vsplit",
}

-- Vim-Smoothie
vim.g.smoothie_experimental_mappings = true

-- Emmet-Vim
vim.g.user_emmet_leader_key='<C-L>'
