local lsp = require('lspconfig')
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

lsp.gopls.setup {
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusuedparams = true,
      },
      staticcheck = true,
      experimentalWorkspaceModule = true,
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
