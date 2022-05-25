local gps = require('nvim-gps')

require("lualine").setup {
  options = {
    theme = 'auto',
    icons_enabled = false,
    disabled_filetypes = {'NvimTree'},
    extensions = { 'quickfix', 'fugitive' },
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
      { gps.get_location, cond = gps.is_available },
    },
  },
}
