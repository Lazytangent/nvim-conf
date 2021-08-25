local nvim_lsp = require('lspconfig')

local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

local autopep8 = require("efm.autopep8")
local black = require("efm.black")
local eslint = require("efm.eslint")
local isort = require("efm.isort")
local prettier = require("efm.prettier")

nvim_lsp.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  root_dir = vim.loop.cwd,
  filetypes = {
    "python",
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
      python = { black, isort, autopep8 },
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
