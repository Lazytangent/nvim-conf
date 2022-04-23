local gps = require('nvim-gps')

require("lualine").setup {
  options = {
    -- theme = "nightfly",
    theme = 'tokyonight',
    -- theme = 'catppuccin',
    icons_enabled = false,
    disabled_filetypes = {'NvimTree'},
    extensions = { 'quickfix', 'fugitive' },
  },
  sections = {
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources = { 'nvim_diagnostic' }}},
    lualine_c = { "os.date('%c')", { 'filename', file_status = true, path = 1 }, 'diff', { gps.get_location, cond = gps.is_available } },
  },
}
