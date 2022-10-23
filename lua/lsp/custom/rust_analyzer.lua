local lsp = require("lspconfig")
local on_attach = require("lsp.primary.on_attach")
local capabilities = require('lsp.capabilities')

lsp.rust_analyzer.setup {
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  on_attach = on_attach,
  capabilities = capabilities,
}
