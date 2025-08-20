local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

---@type vim.lsp.Config
return {
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/.config/nvim/spell/en.utf-8.add",
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
