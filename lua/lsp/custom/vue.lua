local lsp = require('lspconfig')
local on_attach = require('lsp.regular.on_attach')
local capabilities = require('lsp.capabilities')

lsp.vuels.setup {
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
}
