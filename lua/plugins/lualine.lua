local gps = require('nvim-gps')

require("lualine").setup {
  options = {
    -- theme = "nightfly",
    theme = 'tokyonight',
    icons_enabled = false,
    disabled_filetypes = {'NvimTree'},
  },
  sections = {
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff', { gps.get_location, condition = gps.is_available }},
    lualine_z = {'location', {'diagnostics', sources = {'nvim_lsp'}, sections = {'error', 'warn', 'info'}}},
  },
}
