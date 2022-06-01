local nvim_lsp = require('lspconfig')

local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.regular.on_attach")

local autopep8 = require("lsp.efm.autopep8")
local black = require("lsp.efm.black")
local eslint = require("lsp.efm.eslint")
local isort = require("lsp.efm.isort")
local prettier = require("lsp.efm.prettier")

nvim_lsp.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  root_dir = vim.loop.cwd,
  filetypes = {
    "python",
    "json",
    "javascript",
    "typescript",
    "html",
    "css",
    "yaml",
    "markdown",
    "javascriptreact",
    "typescriptreact",
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      python = { isort, autopep8, black },
      typescript = { prettier, eslint },
      javascript = { prettier, eslint },
      typescriptreact = { prettier, eslint },
      javascriptreact = { prettier, eslint },
      yaml = { prettier },
      json = { prettier },
      html = { prettier },
      css = { prettier },
      markdown = { prettier },
    },
  },
})
