require('catppuccino').setup(
  {
    colorscheme = "neon_latte",
    integrations = {
      lsp_trouble = true,
      gitsigns = true,
      telescope = true,
      nvimtree = { enabled = true, show_root = true },
      which_key = true,
      indent_blankline = { enabled = true },
      markdown = true,
    },
  }
)
