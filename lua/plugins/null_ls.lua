local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.json_tool,
  null_ls.builtins.formatting.prettierd.with({
    args = { "$FILENAME", "--single-quote", "--trailing-comma all" }
  }),
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.sqlformat,
  null_ls.builtins.formatting.yapf,

  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.misspell,
}

null_ls.config({ sources = sources })
