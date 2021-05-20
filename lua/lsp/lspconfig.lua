local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require"lspconfig".clangd.setup{}
require"lspconfig".html.setup { capabilities = capabilities, }
require"lspconfig".jedi_language_server.setup {}
require"lspconfig".jsonls.setup {}
require"lspconfig".pyright.setup {}
require"lspconfig".tsserver.setup {}
require"lspconfig".vimls.setup {}
