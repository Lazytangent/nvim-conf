return {
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
  { "monaqa/dial.nvim", config = function() require 'extensions.quality-of-life.configs.dial' end },
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
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require 'extensions.quality-of-life.configs.gitsigns'
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
      require 'extensions.quality-of-life.configs.indent-blankline'
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
      require 'extensions.quality-of-life.configs.comment-nvim'
    end
  },
  {
    "pianocomposer321/yabs.nvim",
    config = function()
      require 'extensions.quality-of-life.configs.yabs'
    end,
  },
  "ryanoasis/vim-devicons",
  require 'extensions.quality-of-life.configs.diffview',
  {
    "windwp/nvim-autopairs",
    config = function()
      require 'extensions.quality-of-life.configs.autopairs'
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
      require 'extensions.quality-of-life.configs.neotest'
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
  { "kyazdani42/nvim-tree.lua", opts = require 'extensions.quality-of-life.configs.nvim-tree' },
  { "pwntester/octo.nvim", config = true },
  { "stevearc/oil.nvim", config = true },
}
