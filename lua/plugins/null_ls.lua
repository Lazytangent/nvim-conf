local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.json_tool,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.sqlformat,
  null_ls.builtins.formatting.yapf,

  null_ls.builtins.diagnostics.eslint.with({
    command = "eslint_d"
  }),
}

null_ls.config({ sources = sources })
