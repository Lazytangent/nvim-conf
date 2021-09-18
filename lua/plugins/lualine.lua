local gps = require('nvim-gps')

require("lualine").setup {
  options = {
    -- theme = "nightfly",
    -- theme = 'tokyonight',
    theme = 'catppuccino',
    icons_enabled = false,
    disabled_filetypes = {'NvimTree'},
    extensions = { 'quickfix', 'fugitive' },
  },
  sections = {
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources = { 'nvim_lsp' }}},
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff', { gps.get_location, cond = gps.is_available }},
  },
}
