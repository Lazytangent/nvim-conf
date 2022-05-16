local null_ls = require("null-ls")
local on_attach = require("lsp.regular.on_attach")

local sources = {
  -- Formatting
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.eslint_d,

  null_ls.builtins.formatting.json_tool,

  null_ls.builtins.formatting.stylua,

  null_ls.builtins.formatting.rustfmt,

  null_ls.builtins.formatting.sqlformat,

  null_ls.builtins.formatting.yapf,
  null_ls.builtins.formatting.autopep8,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,

  null_ls.builtins.formatting.rubocop,

  null_ls.builtins.formatting.stylelint,

  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.goimports,

  null_ls.builtins.formatting.clang_format,

  null_ls.builtins.formatting.trim_whitespace.with({
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  }),

  -- Linting
  null_ls.builtins.diagnostics.flake8,

  null_ls.builtins.diagnostics.rubocop,

  null_ls.builtins.diagnostics.shellcheck,
}

null_ls.setup {
  sources = sources,
  save_after_format = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  on_attach = on_attach,
}
