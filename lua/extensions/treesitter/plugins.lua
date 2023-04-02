return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'extensions.treesitter'
    end,
  },
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-context",

  "JoosepAlviste/nvim-ts-context-commentstring",
  "RRethy/nvim-treesitter-endwise",
  "HiPhish/nvim-ts-rainbow2",
  "theHamsta/nvim-treesitter-pairs",
  "windwp/nvim-ts-autotag",
  "phelipetls/jsonpath.nvim",
  "yioneko/nvim-yati",
  {
    "yioneko/vim-tmindent",
    config = function()
      require 'extensions.tmindent'
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
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}