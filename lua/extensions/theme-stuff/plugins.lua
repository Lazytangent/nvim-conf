return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require 'extensions.theme-stuff.configs.lualine'
    end,
    lazy = false,
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
    },
  },
  "B4mbus/oxocarbon-lua.nvim",
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   opts = {
  --     flavour = "mocha",
  --     transparent_background = true,
  --     term_colors = true,
  --     integrations = {
  --       cmp = true,
  --       fidget = true,
  --       gitsigns = true,
  --       indent_blankline = { enabled = true },
  --       leap = true,
  --       lightspeed = true,
  --       lsp_trouble = true,
  --       markdown = true,
  --       nvimtree = { enabled = true, show_root = true },
  --       symbols_outline = true,
  --       telescope = true,
  --       ts_rainbow = true,
  --       which_key = true,
  --     },
  --   },
  -- },
}
