local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  init_options = {
    journal_file = "~/.local/src/beancount/account.bean",
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
