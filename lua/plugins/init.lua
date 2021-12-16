local packer = require("packer")

packer.init {
  max_jobs = 50,
}

packer.startup(function()
  -- Packer.nvim
  use("wbthomason/packer.nvim")

  -- Theme Stuff
  use({
    "nvim-lualine/lualine.nvim",
    "folke/tokyonight.nvim",
    "marko-cerovac/material.nvim",
    "shaunsingh/moonlight.nvim",
    "catppuccin/nvim",
  })

  -- Treesitter
  use({
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "theHamsta/nvim-treesitter-pairs",
    "windwp/nvim-ts-autotag",
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" },
    { "ThePrimeagen/refactoring.nvim", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },
  })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "mattn/emmet-vim",
    {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },

    -- nvim-cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "lukas-reineke/cmp-under-comparator",
    "lukas-reineke/cmp-rg",
    "f3fora/cmp-spell",
    "ray-x/cmp-treesitter",
    "quangnguyen30192/cmp-nvim-tags",
    "saadparwaiz1/cmp_luasnip",
    "kdheepak/cmp-latex-symbols",
    "onsails/lspkind-nvim",
    { "RishabhRD/nvim-lsputils", requires = "RishabhRD/popfix" },
    { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } },
    "andersevenrud/cmp-tmux",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  })

  -- Specific Language Plugins
  use({
    { "heavenshell/vim-jsdoc", run = "make install" },
    "leafgarland/typescript-vim",
    "peitalin/vim-jsx-typescript", -- *.tsx files
    { "maxmellon/vim-jsx-pretty", ft = { "js", "jsx", "tsx" } },
    { "pantharshit00/vim-prisma", ft = "prisma" },
    { "plasticboy/vim-markdown", ft = "markdown" },
    "mrdotb/vim-tailwindcss",
    { "jidn/vim-dbml", ft = "dbml" },
    { "lervag/vimtex", ft = "tex" },
    { "digitaltoad/vim-pug", ft = "pug" },
    { "elixir-editors/vim-elixir", ft = "elixir" },
    "nvim-orgmode/orgmode.nvim",
    "keith/swift.vim",
    "tami5/swift.nvim",
    "hashivim/vim-terraform",
  })

  -- Quality of Life Improvements
  use({
    "nathom/filetype.nvim",
  })
  -- Telescope
  use({
    { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-raw.nvim" } } },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } },
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-live-grep-raw.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  })

  use({
    { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" },
    "andymass/vim-matchup",
    "ggandor/lightspeed.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "kyazdani42/nvim-web-devicons",
    "ryanoasis/vim-devicons",
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim",
    "dhruvasagar/vim-table-mode",
    "lukas-reineke/headlines.nvim",

    -- Folke Section
    "folke/lsp-colors.nvim",
    "folke/trouble.nvim",
    "folke/which-key.nvim",
    "folke/zen-mode.nvim",
    "folke/todo-comments.nvim",

    "tversteeg/registers.nvim",
    "itmecho/neoterm.nvim",
    'kyazdani42/nvim-tree.lua',
    "jondkinney/dragvisuals.vim",
    "jubnzv/mdeval.nvim",

    -- Tpope Section
    "tpope/vim-surround",
    "tpope/vim-dispatch",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-eunuch",
    "tpope/vim-dadbod",
    "tpope/vim-heroku",
    "tpope/vim-dotenv",
    "tpope/vim-ragtag",
    "tpope/vim-unimpaired",
    "tpope/vim-rails",

    "wellle/targets.vim",
    "psliwka/vim-smoothie",
    "kana/vim-textobj-user",
    "kana/vim-textobj-line",
    "christoomey/vim-sort-motion",
    "michaeljsmith/vim-indent-object",
    "norcalli/nvim-terminal.lua",
    { "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim" },
  })
end)

require "plugins.general"
