local parentModule = (...):match("(.-)[^%.]+$")

return {
  {
    -- Edit code blocks nested inside other buffers
    "AckslD/nvim-FeMaco.lua",
    opts = {
      prepare_buffer = function(opts)
        vim.cmd '30new'
        return vim.api.nvim_get_current_win()
      end,
      ensure_newline = function(base_filetype)
        return true
      end,
    },
    event = "VeryLazy",
  },
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",
    config = function() require 'extensions.quality-of-life.configs.dial' end
  },
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
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require 'extensions.quality-of-life.configs.gitsigns'
    end,
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
  },
  {
    "dhruvasagar/vim-table-mode",
    event = "VeryLazy",
  },
  { "j-hui/fidget.nvim", event = "VeryLazy", config = true },
  { "kyazdani42/nvim-web-devicons", event = "VeryLazy" },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
    },
    main = "ibl",
  },
  {
    "mattn/emmet-vim",
    init = function()
      vim.g.user_emmet_leader_key = '<C-l>'

      vim.g.user_emmet_settings = {
        javascript = {
          extends = 'jsx',
        },
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require 'extensions.quality-of-life.configs.comment-nvim'
    end
  },
  {
    "sindrets/diffview.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require 'extensions.quality-of-life.configs.autopairs'
    end,
    event = "VeryLazy",
  },

  -- Folke Section
  require(parentModule .. 'folke'),

  -- Tpope Section
  require(parentModule .. 'tpope'),

  {
    "jondkinney/dragvisuals.vim",
    init = function()
      vim.g.DVB_TrimWS = 1
    end,
    event = "VeryLazy",
  },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "tversteeg/registers.nvim", event = "VeryLazy" },
  { "wellle/targets.vim", event = "VeryLazy" },
  { "stevearc/oil.nvim", config = true, event = "VeryLazy" },
  { "dgagn/diagflow.nvim", config = true, },
  { "SmiteshP/nvim-navic", dependencies = { "neovim/nvim-lspconfig" } },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "stylelint" },
        go = { "goimports", "gofmt" },
        javascript = { "prettier", "eslint_d" },
        json = { "jq" },
        lua = { "stylua" },
        python = { "isort", "black", "ruff_format", "ruff_fix" },
        ruby = { "rubocop" },
        rust = { "rustfmt" },
        sql = { "sql_formatter" },
        terraform = { "terraform_fmt" },
        ["*"] = { "trim_whitespace" },
      },
    },
  },
  {
    "rest-nvim/rest.nvim",
  },
  {
    "kylechui/nvim-surround",
    config = true,
  },
}
