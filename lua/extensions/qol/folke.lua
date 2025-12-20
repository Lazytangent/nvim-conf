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
    opts = {
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      win = {
        no_overlap = false,
      },
    },
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
    config = true,
  },
}
