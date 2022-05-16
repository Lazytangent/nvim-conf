local null_ls = require("null-ls")
local on_attach = require("lsp.regular.on_attach")

local formatting = {
  -- JavaScript/TypeScript
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.eslint_d,

  -- JSON
  null_ls.builtins.formatting.json_tool,

  -- Lua
  null_ls.builtins.formatting.stylua,

  -- Rust
  null_ls.builtins.formatting.rustfmt,

  -- SQL
  null_ls.builtins.formatting.sqlformat,

  -- Python
  null_ls.builtins.formatting.yapf,
  null_ls.builtins.formatting.autopep8,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,

  -- Ruby
  null_ls.builtins.formatting.rubocop,

  -- CSS/HTML
  null_ls.builtins.formatting.stylelint,

  -- Go
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.goimports,

  -- C/C++
  null_ls.builtins.formatting.clang_format,

  null_ls.builtins.formatting.trim_whitespace.with({
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  }),
}

local linting = {
  -- Python
  null_ls.builtins.diagnostics.flake8,

  -- Ruby
  null_ls.builtins.diagnostics.rubocop,

  -- Shell
  null_ls.builtins.diagnostics.shellcheck,
}

local sources = vim.tbl_extend("force", formatting, linting)

null_ls.setup {
  sources = sources,
  save_after_format = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  on_attach = on_attach,
}
