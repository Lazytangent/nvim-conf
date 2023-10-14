return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'extensions.treesitter.configs.treesitter'

      require 'extensions.treesitter.configs.http-parser'
    end,
    dependencies = {
      -- { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
  },
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",

  "JoosepAlviste/nvim-ts-context-commentstring",
  "RRethy/nvim-treesitter-endwise",
  "theHamsta/nvim-treesitter-pairs",
  "windwp/nvim-ts-autotag",
  "phelipetls/jsonpath.nvim",
  {
    "yioneko/vim-tmindent",
    config = function()
      require 'extensions.treesitter.configs.tmindent'
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    config = true,
    event = "VeryLazy",
  },
  {
    "David-Kunz/treesitter-unit",
  },
  {
    url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
    config = function()
      local highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
          vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
          vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
          vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
          vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
          vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
          vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
          vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
