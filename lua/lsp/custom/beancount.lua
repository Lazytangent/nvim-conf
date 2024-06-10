local lsp = require('lspconfig')
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

lsp.beancount.setup {
  init_options = {
    journal_file = "~/.local/src/beancount/account.bean",
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
