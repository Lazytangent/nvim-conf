-- Formatting settings
local format_options_prettier = {
  tabWidth = 2,
  singleQuote = true,
  trailingComma = "all",
  configPrecedence = "prefer-file"
}

vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = {
  tabWidth = 4,
  singleQuote = false,
  trailingComma = "all",
  configPrecedence = "prefer-file"
}
vim.g.format_options_html = format_options_prettier
vim.g.format_options_markdown = format_options_prettier
vim.g.format_options_css = {
  tabWidth = 2,
  singleQuote = true,
  trailingComma = "all",
  configPrecedence = "prefer-file"
}
vim.g.format_options_yaml = format_options_prettier

-- LSP Config
local LSP = require("config").LSP

vim.diagnostic.config {
  virtual_text = LSP.virtual_text,
  signs = true,
  update_in_insert = false,
}

-- group, list
for _, list in pairs(LSP.servers) do
  vim.lsp.enable(list)
end

-- Register LspAttach autocmds
require 'lsp.primary.on_attach'
require 'lsp.regular.on_attach'
