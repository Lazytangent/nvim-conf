local lsp = require('lspconfig')
local on_attach = require 'lsp.primary.on_attach'
local capabilities = require 'lsp.capabilities'

lsp.denols.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
}
