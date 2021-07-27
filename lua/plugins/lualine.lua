require("lualine").setup {
  options = {
    -- theme = "nightfly",
    theme = 'tokyonight',
    icons_enabled = false,
  },
  sections = {
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff'},
    lualine_z = {'location', {'diagnostics', sources = {'nvim_lsp'}, sections = {'error', 'warn', 'info'}}},
  },
}
