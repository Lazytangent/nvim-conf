local capabilities = require('lsp.capabilities')

---@type vim.lsp.Config
return {
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/.config/nvim/spell/en.utf-8.add",
    },
  },
  filetypes = {
    'org',
    'markdown',
    'latex',
    'tex',
  },
  capabilities = capabilities,
}
