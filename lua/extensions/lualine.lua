local gps = require('nvim-gps')
local jsonpath = require('jsonpath')

require("lualine").setup {
  extensions = { 'quickfix', 'fugitive' },
  options = {
    theme = 'auto',
    icons_enabled = false,
    disabled_filetypes = {
      statusline = {'NvimTree'},
    },
    globalstatus = true,
    refresh = {
      statusline = 500,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1, 1) end },
    },
    lualine_b = {
      'branch',
      {'diagnostics', sources = { 'nvim_diagnostic', 'nvim_lsp' }}
    },
    lualine_c = {
      "os.date('%c')",
      { 'filename', file_status = true },
      'diff',
    },
  },
  winbar = {
    lualine_c = {{ gps.get_location, cond = gps.is_available }, jsonpath.get },
    lualine_y = {{'filename', path = 1}},
  },
  inactive_winbar = {
    lualine_y = {{'filename', path = 1}},
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
      },
    },
  },
}
