return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")

      ls.config.setup({
        history = true,
        updateevents = "TextChangedI",
        store_selection_keys = "<Tab>",
      })

      require 'extensions.lsp.luasnip.snippets'
    end,
  },
  "neovim/nvim-lspconfig",
  "rafamadriz/friendly-snippets",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require 'extensions.lsp.configs.null-ls'
    end,
  },

  -- nvim-cmp
  "f3fora/cmp-spell",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-calc",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-omni",
  "hrsh7th/cmp-path",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require 'extensions.lsp.configs.cmp'
    end,
  },
  "kdheepak/cmp-latex-symbols",
  "lukas-reineke/cmp-rg",
  "lukas-reineke/cmp-under-comparator",
  "onsails/lspkind-nvim",
  "ray-x/cmp-treesitter",
  "saadparwaiz1/cmp_luasnip",
  {
    "RishabhRD/nvim-lsputils",
    dependencies = { "RishabhRD/popfix" },
    config = function()
      require 'extensions.lsp.configs.lsputils'
    end
  },
  {
    'Saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    opts = {
      inlay_hints = {
        highlight = "Comment",
      },
    },
  },
}
