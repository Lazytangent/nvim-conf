return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'extensions.treesitter.configs.treesitter'

      require 'extensions.treesitter.configs.http-parser'
    end,
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
  },
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",

  "JoosepAlviste/nvim-ts-context-commentstring",
  "RRethy/nvim-treesitter-endwise",
  "theHamsta/nvim-treesitter-pairs",
  "windwp/nvim-ts-autotag",
  "phelipetls/jsonpath.nvim",
  "yioneko/nvim-yati",
  {
    "yioneko/vim-tmindent",
    config = function()
      require 'extensions.treesitter.configs.tmindent'
    end,
  },
  {
    "Lazytangent/nvim-gps",
    dev = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      icons = {
        ["container-name"] = "〇 ",
      },
      languages = {
        ["json"] = false,
      },
    },
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    config = true,
    event = "VeryLazy",
  },
}
