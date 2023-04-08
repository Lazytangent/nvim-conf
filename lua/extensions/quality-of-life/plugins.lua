return {
  {
    "kdheepak/lazygit.nvim",
    config = function()
      if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
        vim.cmd([[let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"]])
      end
    end,
    event = "VeryLazy",
  },
  {
    "AckslD/nvim-FeMaco.lua",
    opts = {
      prepare_buffer = function(opts)
        vim.cmd '30new'
        return vim.api.nvim_get_current_win()
      end,
    },
    event = "VeryLazy",
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
    },
    event = "VeryLazy",
  },
  { "monaqa/dial.nvim", event = "VeryLazy", config = function() require 'extensions.quality-of-life.configs.dial' end },
  {
    "hkupty/iron.nvim",
    event = "VeryLazy",
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
  { "simrat39/symbols-outline.nvim", event = "VeryLazy", config = true },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require 'extensions.quality-of-life.configs.gitsigns'
    end,
  },
  {
    "ggandor/flit.nvim",
    dependencies = {
      {
        "ggandor/leap.nvim",
        config = function(_plugin, _opts)
          require('leap').add_default_mappings()
        end,
      },
    },
    config = true,
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
  },
  {
    "dhruvasagar/vim-table-mode",
    event = "VeryLazy",
  },
  {
    "ggandor/leap-ast.nvim",
    event = "VeryLazy",
  },
  { "j-hui/fidget.nvim", event = "VeryLazy", config = true },
  { "kyazdani42/nvim-web-devicons", event = "VeryLazy" },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require 'extensions.quality-of-life.configs.indent-blankline'
    end,
  },
  {
    "mattn/emmet-vim",
    event = "VeryLazy",
    ft = { "html", "htmldjango", "javascriptreact", "typescriptreact" },
    init = function()
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
    event = "VeryLazy",
    opts = {
      hooks = {
        open = { "Telescope find_files" },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require 'extensions.quality-of-life.configs.comment-nvim'
    end
  },
  {
    "pianocomposer321/yabs.nvim",
    event = "VeryLazy",
    config = function()
      require 'extensions.quality-of-life.configs.yabs'
    end,
  },
  { "ryanoasis/vim-devicons", event = "VeryLazy" },
  require 'extensions.quality-of-life.configs.diffview',
  {
    "windwp/nvim-autopairs",
    config = function()
      require 'extensions.quality-of-life.configs.autopairs'
    end,
    event = "VeryLazy",
  },

  -- Folke Section
  { "folke/lsp-colors.nvim", event = "VeryLazy", config = true },
  {
    "folke/todo-comments.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    opts = {
      mode = 'document_diagnostics',
    },
    event = "VeryLazy",
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
    event = "VeryLazy",
  },

  -- Tpope Section
  { "tpope/vim-eunuch", event = "VeryLazy" },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-unimpaired", event = "VeryLazy" },

  -- Testing
  {
    "rcarriga/neotest",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
    config = function()
      require 'extensions.quality-of-life.configs.neotest'
    end,
    event = "VeryLazy",
  },
  { "rcarriga/neotest-plenary", event = "VeryLazy" },
  { "rcarriga/neotest-python", event = "VeryLazy" },
  { "rcarriga/neotest-vim-test", event = "VeryLazy" },
  { "vim-test/vim-test", event = "VeryLazy" },
  { "haydenmeade/neotest-jest", event = "VeryLazy" },
  { "rouge8/neotest-rust", event = "VeryLazy" },

  {
    "jondkinney/dragvisuals.vim",
    init = function()
      vim.g.DVB_TrimWS = 1
    end,
    event = "VeryLazy",
  },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "norcalli/nvim-terminal.lua", config = true, event = "VeryLazy" },
  { "tversteeg/registers.nvim", event = "VeryLazy" },
  { "wellle/targets.vim", event = "VeryLazy" },
  { "kyazdani42/nvim-tree.lua", event = "VeryLazy", opts = require 'extensions.quality-of-life.configs.nvim-tree' },
  { "pwntester/octo.nvim", event = "VeryLazy", config = true },
  { "stevearc/oil.nvim", config = true, event = "VeryLazy" },
}
