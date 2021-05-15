require("trouble").setup {}
require("lsp-colors").setup {}
require("lualine").setup {
  options = {
    theme = "nightfly",
  },
  sections = {
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff'},
    lualine_z = {'location', {'diagnostics', sources = {'nvim_lsp' ,'coc', 'ale'}, sections = {'error', 'warn', 'info'}}},
  },
}
require('lspconfig').clangd.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  capabilities = capabilities,
}

require('lspconfig').jedi_language_server.setup {}
require('lspconfig').jsonls.setup {}
require('lspconfig').pyright.setup {}
require('lspconfig').tsserver.setup {}
require('lspconfig').vimls.setup {}

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    disable = {},
  },
}


