local nvim_lsp = require("lspconfig")
local on_attach = require("lsp.on_attach")

nvim_lsp["null-ls"].setup({
  on_attach = on_attach,
})
