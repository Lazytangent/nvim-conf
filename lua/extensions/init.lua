local lazy = require('lazy')

local lazy_opts = {
  concurrency = 50,
  dev = {
    path = "~/.local/src/neovim-plugins",
  },
}

-- Theme Stuff
local theme_stuff = {
  "folke/tokyonight.nvim",
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require 'extensions.lualine'
    end,
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
    },
  },
  "B4mbus/oxocarbon-lua.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        leap = true,
        lightspeed = true,
        lsp_trouble = true,
        markdown = true,
        nvimtree = { enabled = true, show_root = true },
        symbols_outline = true,
        telescope = true,
        ts_rainbow = true,
        which_key = true,
      },
    },
  },
}

-- Treesitter
local treesitter = {
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

-- LSP
local lsp = {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")

      ls.config.setup({
        history = true,
        updateevents = "TextChangedI",
        store_selection_keys = "<Tab>",
      })

      require 'extensions.luasnip.snippets'
    end,
  },
  "neovim/nvim-lspconfig",
  "rafamadriz/friendly-snippets",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require 'extensions.null_ls'
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
      require 'extensions.cmp'
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
      require 'extensions.lsputils'
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

-- DAP
local dap = {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require 'extensions.dap'
    end,
  },
  "mfussenegger/nvim-dap-python",
  "theHamsta/nvim-dap-virtual-text",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = true,
  },
}

-- Specific Language Plugins
local languages = {
  {
    "heavenshell/vim-jsdoc",
    build = "make install",
  },
  {
    "pantharshit00/vim-prisma",
    ft = "prisma",
  },
  {
    "jidn/vim-dbml",
    ft = "dbml",
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      require 'extensions.vimtex'
    end
  },
  {
    "digitaltoad/vim-pug",
    ft = "pug",
  },
  {
    "elixir-editors/vim-elixir",
    ft = "elixir",
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  {
    "hashivim/vim-terraform",
    ft = "terraform",
  },
  {
    "ray-x/go.nvim",
    ft = "go",
    opts = { textobjects = false, luasnip = true },
  },
  { "b0o/schemastore.nvim", ft = { "json", "yaml" } },
  { "carbon-language/vim-carbon-lang", ft = "carbon" },
  { "keith/swift.vim", ft = "swift"},
  "mrdotb/vim-tailwindcss",
  {
    "nvim-orgmode/orgmode.nvim",
    ft = "org",
    config = function()
      require 'extensions.orgmode'
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require 'extensions.rust_tools'
    end,
  },
  { "tami5/swift.nvim", ft = "switft", main = "swift_env", opts = require("extensions.swift") },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "vim-scripts/groovyindent-unix", ft = "groovy" },
}

-- Quality of Life Improvements
local qol = {
  {
    "kdheepak/lazygit.nvim",
    config = function()
      if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
        vim.cmd([[let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"]])
      end
    end,
  },
  {
    "AckslD/nvim-FeMaco.lua",
    opts = {
      prepare_buffer = function(opts)
        vim.cmd '30new'
        return vim.api.nvim_get_current_win()
      end,
    },
  },
  {
    "gaoDean/autolist.nvim",
    opts = {
      lists = {
        filetypes = {
          generic = {
            "org",
          },
        },
      },
    }
  },
  { "monaqa/dial.nvim", config = function() require 'extensions.dial' end },
  {
    "hkupty/iron.nvim",
    main = "iron.core",
    config = function()
      require('iron.core').setup({
        config = {
          scratch_repl    = true,
          repl_definition = {},
          repl_open_cmd   = require("iron.view").bottom(40),
        },
        keymaps = {
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_file   = "<leader>sf",
          send_line   = "<leader>sl",
          cr          = "<leader>s<cr>",
          exit        = "<leader>sq",
          clear       = "<leader>sC",
        },
      })
    end,
  },
  { "simrat39/symbols-outline.nvim", config = true },
}

-- Dadbod
local dadbod = {
  "tpope/vim-dadbod",
  {
    "kristijanhusak/vim-dadbod-ui",
    config = function()
      vim.g.db_ui_env_variable_url = 'DATABASE_URL'
      vim.g.db_ui_env_variable_name = 'DATABASE_NAME'
    end,
  },
  "kristijanhusak/vim-dadbod-completion",
}

-- Telescope
local telescope = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require 'extensions.telescope.config'
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "tami5/sqlite.lua" },
  },
  "nvim-telescope/telescope-dap.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-project.nvim",
  "benfowler/telescope-luasnip.nvim",
}

local more_qol = {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require 'extensions.gitsigns'
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function(_plugin, _opts)
      require('leap').add_default_mappings()
    end,
  },
  "andymass/vim-matchup",
  "dhruvasagar/vim-table-mode",
  "ggandor/leap-ast.nvim",
  { "j-hui/fidget.nvim", config = true },
  "kyazdani42/nvim-web-devicons",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require 'extensions.indent_blankline'
    end,
  },
  {
    "mattn/emmet-vim",
    config = function()
      vim.g.user_emmet_leader_key='<C-L>'

      vim.g.user_emmet_settings = {
        javascript = {
          extends = 'jsx',
        },
      }
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    opts = {
      hooks = {
        open = { "Telescope find_files" },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require 'extensions.comment_nvim'
    end
  },
  {
    "pianocomposer321/yabs.nvim",
    config = function()
      require 'extensions.yabs'
    end,
  },
  "ryanoasis/vim-devicons",
  require 'extensions.diffview',
  {
    "windwp/nvim-autopairs",
    config = function()
      require 'extensions.autopairs'
    end,
  },

  -- Folke Section
  { "folke/lsp-colors.nvim", config = true },
  {
    "folke/todo-comments.nvim",
    config = true,
  },
  {
    "folke/trouble.nvim",
    opts = {
      mode = 'document_diagnostics',
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        plugins = {
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
        key_labels = {
          ["<leader>"] = "SPC",
          ["<localleader>"] = "SPC m",
          ["<space>"] = "SPC",
        },
      }

      require("mappings")
    end,
  },

  -- Tpope Section
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",

  -- Testing
  {
    "rcarriga/neotest",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
    config = function()
      require 'extensions.neotest'
    end,
  },
  "rcarriga/neotest-plenary",
  "rcarriga/neotest-python",
  "rcarriga/neotest-vim-test",
  "vim-test/vim-test",
  "haydenmeade/neotest-jest",
  "rouge8/neotest-rust",

  {
    "jondkinney/dragvisuals.vim",
    config = function()
      vim.g.DVB_TrimWS = 1
    end,
  },
  "junegunn/vim-easy-align",
  { "norcalli/nvim-terminal.lua", config = true },
  "tversteeg/registers.nvim",
  "wellle/targets.vim",
  { "kyazdani42/nvim-tree.lua", opts = require 'extensions.nvim_tree' },
  { "pwntester/octo.nvim", config = true },
  { "stevearc/oil.nvim", config = true },
}

-- Custom fixes for recent problems
local custom = {
  {
    "Lazytangent/nvim-surround",
    config = true,
  },
}

local plugins = {
  theme_stuff,
  treesitter,
  lsp,
  dap,
  languages,
  qol,
  dadbod,
  telescope,
  more_qol,
  custom,
}

lazy.setup(plugins, lazy_opts)
