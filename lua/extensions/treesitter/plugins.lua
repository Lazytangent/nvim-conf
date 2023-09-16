return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'extensions.treesitter.configs.treesitter'

      require 'extensions.treesitter.configs.http-parser'
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", config = true },
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
  { url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git" }
}
