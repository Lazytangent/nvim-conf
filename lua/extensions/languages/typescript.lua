return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
  },
  opts = {
    on_attach = require('lsp.primary.on_attach'),
    settings = {
      expose_as_code_action = {
        "fix_all",
        "add_missing_imports",
        "remove_unused",
      },
    },
  },
  event = "VeryLazy",
  ft = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
  },
}
