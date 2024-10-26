return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = true,
    term_colors = true,
    integrations = {
      cmp = true,
      fidget = true,
      gitsigns = true,
      indent_blankline = { enabled = true },
      leap = true,
      lightspeed = true,
      lsp_trouble = true,
      markdown = true,
      nvimtree = { enabled = true, show_root = true },
      symbols_outline = true,
      telescope = true,
      ts_rainbow = true,
      which_key = true,
    },
  },
}
