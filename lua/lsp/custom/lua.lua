local lspconfig = require('lspconfig')
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
