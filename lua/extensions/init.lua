local packer = require("packer")

packer.init {
  max_jobs = 50,
}

packer.startup(function()
  -- Packer.nvim
  use("wbthomason/packer.nvim")

  -- Theme Stuff
  use({
    "folke/tokyonight.nvim",
    "nvim-lualine/lualine.nvim",
    { "catppuccin/nvim", as = "catppuccin" },
  })

  -- Treesitter
  use({
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",

    "JoosepAlviste/nvim-ts-context-commentstring",
    "RRethy/nvim-treesitter-endwise",
    "lewis6991/spellsitter.nvim",
    "p00f/nvim-ts-rainbow",
    "theHamsta/nvim-treesitter-pairs",
    "windwp/nvim-ts-autotag",
    { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" },
    { "ThePrimeagen/refactoring.nvim", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },
  })

  -- LSP
  use({
    "L3MON4D3/LuaSnip",
    "mattn/emmet-vim",
    "neovim/nvim-lspconfig",
    "rafamadriz/friendly-snippets",
    { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } },

    -- nvim-cmp
    "f3fora/cmp-spell",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "kdheepak/cmp-latex-symbols",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
    "lukas-reineke/cmp-rg",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind-nvim",
    "ray-x/cmp-treesitter",
    "saadparwaiz1/cmp_luasnip",
    { "RishabhRD/nvim-lsputils", requires = "RishabhRD/popfix" },
    { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } },
  })

  -- DAP
  use({
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
  })

  -- Specific Language Plugins
  use({
    { "heavenshell/vim-jsdoc", run = "make install" },
    { "pantharshit00/vim-prisma", ft = "prisma" },
    { "jidn/vim-dbml", ft = "dbml" },
    { "lervag/vimtex", ft = "tex" },
    { "digitaltoad/vim-pug", ft = "pug" },
    { "elixir-editors/vim-elixir", ft = "elixir" },
    { "fladson/vim-kitty", ft = "kitty" },
    { "hashivim/vim-terraform", ft = "terraform" },
    "b0o/schemastore.nvim",
    "keith/swift.vim",
    "mrdotb/vim-tailwindcss",
    "nvim-orgmode/orgmode.nvim",
    "ray-x/go.nvim",
    "tami5/swift.nvim",
  })

  -- Quality of Life Improvements
  use({
    "jamestthompson3/nvim-remote-containers",
    "kdheepak/lazygit.nvim",
    "nathom/filetype.nvim",
  })
  -- Telescope
  use({
    { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } } },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } },
    "nvim-telescope/telescope-dap.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "benfowler/telescope-luasnip.nvim",
  })

  use({
    { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" },
    { "ldelossa/gh.nvim", requires = { "ldelossa/litee.nvim" } },
    "andymass/vim-matchup",
    "dhruvasagar/vim-table-mode",
    "dkarter/bullets.vim",
    "ggandor/lightspeed.nvim",
    "j-hui/fidget.nvim",
    "kyazdani42/nvim-web-devicons",
    "lukas-reineke/indent-blankline.nvim",
    "numToStr/Comment.nvim",
    "pianocomposer321/yabs.nvim",
    "ryanoasis/vim-devicons",
    "windwp/nvim-autopairs",

    -- Folke Section
    "folke/lsp-colors.nvim",
    "folke/todo-comments.nvim",
    "folke/trouble.nvim",
    "folke/which-key.nvim",

    -- Tpope Section

    "tpope/vim-dadbod",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    -- Testing
    { "rcarriga/neotest", requires = { "antoinemadec/FixCursorHold.nvim" } },
    "rcarriga/neotest-plenary",
    "rcarriga/neotest-python",
    "rcarriga/neotest-vim-test",
    "vim-test/vim-test",

    "jondkinney/dragvisuals.vim",
    "junegunn/vim-easy-align",
    "norcalli/nvim-terminal.lua",
    "tversteeg/registers.nvim",
    "wellle/targets.vim",
    'kyazdani42/nvim-tree.lua',
  })
end)

require "extensions.general"
