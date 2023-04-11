local lspconfig = require "lspconfig"
local on_attach = require "lsp.primary.on_attach"
local capabilities = require "lsp.capabilities"

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim", "s", "sn", "t", "i", "f", "c", "end", "d", "isn",
          "psn", "l", "rep", "r", "p", "types", "events", "util",
          "fmt", "fmta", "ls", "ins_generate", "parse"
        }
      }
    }
  }
}
