require('catppuccin').setup {
  flavour = "mocha",
  transparent_background = true,
  term_colors = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    indent_blankline = { enabled = true },
    lightspeed = true,
    lsp_trouble = true,
    markdown = true,
    nvimtree = { enabled = true, show_root = true },
    telescope = true,
    ts_rainbow = true,
    which_key = true,
  },
}
