return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  opts = {
    lsp = {
      on_attach = require('lsp.primary.on_attach'),
    },
  },
  event = "VeryLazy",
}
