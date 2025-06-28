local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

require('lspconfig').eslint.setup {
  settings = {
    nodePath = "~/.nvm/versions/node/v14.18.0/bin/node"
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
