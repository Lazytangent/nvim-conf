local gps = require('nvim-gps')

require("lualine").setup {
  options = {
    theme = 'auto',
    icons_enabled = false,
    disabled_filetypes = {'NvimTree'},
    extensions = { 'quickfix', 'fugitive' },
  },
  sections = {
    lualine_b = {
      'branch',
      'diff',
      {'diagnostics', sources = { 'nvim_diagnostic', 'nvim_lsp' }}
    },
    lualine_c = {
      "os.date('%c')",
      { 'filename', file_status = true, path = 1 },
      'diff',
      { gps.get_location, cond = gps.is_available }
    },
  },
  tabline = {
    lualine_a = {
      {
        "windows",
        mode = 2,
      },
    },
  },
}
