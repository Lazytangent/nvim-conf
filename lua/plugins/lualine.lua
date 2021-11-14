local gps = require('nvim-gps')
local package_info = require('package-info')

require("lualine").setup {
  options = {
    -- theme = "nightfly",
    -- theme = 'tokyonight',
    theme = 'catppuccin',
    icons_enabled = false,
    disabled_filetypes = {'NvimTree'},
    extensions = { 'quickfix', 'fugitive' },
  },
  sections = {
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources = { 'nvim_lsp' }}},
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff', { gps.get_location, cond = gps.is_available }, { package_info.get_status() }},
  },
}
