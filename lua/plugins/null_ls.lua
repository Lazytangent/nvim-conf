local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.json_tool,
  null_ls.builtins.formatting.stylua.with({
	  args = { "--indent-width", "2" },
  }),
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.sqlformat,
  null_ls.builtins.formatting.yapf,
  null_ls.builtins.formatting.trim_whitespace.with({
    filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
  }),
}

null_ls.config({ sources = sources, save_after_format = false, diagnostics_format = "[#{c}] #{m} (#{s})" })
