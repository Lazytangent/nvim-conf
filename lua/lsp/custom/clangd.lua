local lsp = require('lspconfig')
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.offsetEncoding = 'utf-16'

lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
