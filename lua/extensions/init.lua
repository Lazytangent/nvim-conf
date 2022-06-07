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
    { "catppuccin/nvim", as = "catppuccin" },
  })

  -- Treesitter
  use({
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",

    "lewis6991/spellsitter.nvim",
    "theHamsta/nvim-treesitter-pairs",
    "windwp/nvim-ts-autotag",
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" },
    { "ThePrimeagen/refactoring.nvim", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },
    "RRethy/nvim-treesitter-endwise",
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
    "saadparwaiz1/cmp_luasnip",
    "kdheepak/cmp-latex-symbols",
    "onsails/lspkind-nvim",
    { "RishabhRD/nvim-lsputils", requires = "RishabhRD/popfix" },
    { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } },
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  })

  -- DAP
  use({
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
  })

  -- Specific Language Plugins
  use({
    { "heavenshell/vim-jsdoc", run = "make install" },
    { "pantharshit00/vim-prisma", ft = "prisma" },
    "mrdotb/vim-tailwindcss",
    { "jidn/vim-dbml", ft = "dbml" },
    { "lervag/vimtex", ft = "tex" },
    { "digitaltoad/vim-pug", ft = "pug" },
    { "elixir-editors/vim-elixir", ft = "elixir" },
    "nvim-orgmode/orgmode.nvim",
    "keith/swift.vim",
    "tami5/swift.nvim",
    "hashivim/vim-terraform",
    "ray-x/go.nvim",
    "b0o/schemastore.nvim",
    "fladson/vim-kitty",
  })

  -- Quality of Life Improvements
  use({
    "nathom/filetype.nvim",
    "kdheepak/lazygit.nvim",
    "jamestthompson3/nvim-remote-containers",
  })
  -- Telescope
  use({
    { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } } },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-dap.nvim",
    "benfowler/telescope-luasnip.nvim",
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
    "j-hui/fidget.nvim",
    "pianocomposer321/yabs.nvim",
    "dkarter/bullets.vim",
    { "ldelossa/gh.nvim", requires = { "ldelossa/litee.nvim" } },

    -- Folke Section
    "folke/lsp-colors.nvim",
    "folke/trouble.nvim",
    "folke/todo-comments.nvim",
    "folke/which-key.nvim",

    -- Tpope Section
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
    "tpope/vim-eunuch",
    "tpope/vim-dadbod",
    "tpope/vim-unimpaired",

    -- Testing
    { "rcarriga/neotest", requires = { "antoinemadec/FixCursorHold.nvim" } },
    "vim-test/vim-test",
    "rcarriga/neotest-python",
    "rcarriga/neotest-plenary",
    "rcarriga/neotest-vim-test",

    "junegunn/vim-easy-align",
    "wellle/targets.vim",
    "norcalli/nvim-terminal.lua",
    "tversteeg/registers.nvim",
    'kyazdani42/nvim-tree.lua',
    "jondkinney/dragvisuals.vim",
  })
end)

require "extensions.general"
