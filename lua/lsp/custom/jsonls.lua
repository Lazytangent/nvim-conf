local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
