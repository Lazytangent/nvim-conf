-- Set up Lua plugins
require("trouble").setup {}
require("lsp-colors").setup {}
require("lualine").setup {
  options = {
    theme = "nightfly",
    icons_enabled = false,
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

-- Vim-Markdown
vim.g.vim_markdown_fenced_languages = {
  'html', 'python', 'css', 'javascript',
  'js=javascript', 'json=javascript', 'sass',
  'viml=vim', 'vim', 'bash=sh',
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
