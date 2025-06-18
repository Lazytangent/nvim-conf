local on_attach = require('lsp.primary.on_attach')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.offsetEncoding = 'utf-16'

local lsp = 'sourcekit'

vim.lsp.config(lsp, {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable(lsp)
