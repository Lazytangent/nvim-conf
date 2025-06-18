local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

local lsp = 'yamlls'

vim.lsp.config(lsp, {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable(lsp)
