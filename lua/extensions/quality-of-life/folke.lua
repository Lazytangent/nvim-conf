return {
  {
    "folke/lsp-colors.nvim",
    config = true,
    event = "VeryLazy",
  },
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
}
