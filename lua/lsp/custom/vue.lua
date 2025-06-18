local on_attach = require('lsp.regular.on_attach')
local capabilities = require('lsp.capabilities')

local lsp = 'vuels'

vim.lsp.config(lsp, {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
          useScaffoldSnippets = true,
        },
        format = {
          defaultFormatter = {
            js = "prettier",
            ts = "pretter",
          },
        },
      },
    },
  }
})
vim.lsp.enable(lsp)
