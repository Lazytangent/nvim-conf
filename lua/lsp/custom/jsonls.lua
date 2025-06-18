local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

local lsp = 'jsonls'

vim.lsp.config(lsp, {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable(lsp)
