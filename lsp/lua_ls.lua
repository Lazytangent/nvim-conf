local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
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
