local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  init_options = {
    journal_file = "~/.local/src/beancount/account.bean",
  },
  capabilities = capabilities,
}
