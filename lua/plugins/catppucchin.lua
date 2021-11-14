require('catppuccin').setup {
  transparent_background = true,
  term_colors = true,
  integrations = {
    lsp_trouble = true,
    gitsigns = true,
    telescope = true,
    nvimtree = { enabled = true, show_root = true },
    which_key = true,
    indent_blankline = { enabled = true },
    markdown = true,
    lightspeed = true,
    ts_rainbow = true,
  },
}
