local nvim_lsp = require("lspconfig")
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
      },
    },
  },
}
