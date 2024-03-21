return {
  "neovim/nvim-lspconfig",
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
    },
    config = function()
      require 'extensions.lsp.configs.null-ls'
    end,
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require 'extensions.lsp.configs.cmp'
    end,
    dependencies = {
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-path",
      "kdheepak/cmp-latex-symbols",
      "lukas-reineke/cmp-rg",
      "lukas-reineke/cmp-under-comparator",
      "onsails/lspkind-nvim",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "petertriho/cmp-git",
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require 'extensions.lsp.luasnip'
        end,
      },
      { "Gelio/cmp-natdat", config = true },
    },
  },
  {
    "RishabhRD/nvim-lsputils",
    dependencies = { "RishabhRD/popfix" },
    config = function()
      require 'extensions.lsp.configs.lsputils'
    end,
    event = "VeryLazy",
  },
  {
    'Saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
  {
    "folke/neodev.nvim",
    config = true,
  },
}
