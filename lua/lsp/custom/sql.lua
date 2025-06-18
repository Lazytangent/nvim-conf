local capabilities = require('lsp.capabilities')
local on_attach = require('lsp.regular.on_attach')

local lsp = 'sqlls'

vim.lsp.config(lsp, {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
})
vim.lsp.enable(lsp)
