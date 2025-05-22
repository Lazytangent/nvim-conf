return {
  -- {
  --   "folke/lsp-colors.nvim",
  --   config = true,
  --   event = "VeryLazy",
  -- },
  {
    "folke/todo-comments.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    opts = {
      mode = "document_diagnostics",
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
      }

      require "mappings"
    end,
    event = "VeryLazy",
  },
  {
    "folke/ts-comments.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      -- modes = {
      --   char = {
      --     autohide = true,
      --   },
      -- },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = "n", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}
