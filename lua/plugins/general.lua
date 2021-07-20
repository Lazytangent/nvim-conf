-- Set up Lua plugins
require("octo").setup {
  default_remote = { "origin", "upstream" };
}
require("trouble").setup {}
require("lsp-colors").setup {}
require("lualine").setup {
  options = {
    theme = "nightfly",
    icons_enabled = false,
  },
  sections = {
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff'},
    lualine_z = {'location', {'diagnostics', sources = {'nvim_lsp'}, sections = {'error', 'warn', 'info'}}},
  },
}

require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '¯' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

require('indent_blankline').setup {}
require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = false;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    ['nvim-treesitter'] = true;
  };
}

require('orgmode').setup {
  org_agenda_files = {'~/Documents/org/*'},
  org_default_notes_file = '~/Documents/org/default.org',
}

require 'plugins.neoterm'

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

-- sneak.vim
vim.g['sneak#label'] = 1
