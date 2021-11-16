local lsp = require('lspconfig')

lsp.java_language_server.setup {
  cmd = { "/Users/petermai/Documents/LSP/java-language-server/dist/lang_server_mac.sh" },
}
