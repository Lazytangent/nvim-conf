local lsp = require('lspconfig')
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

capabilities.offsetEncoding = 'utf-16'

lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
