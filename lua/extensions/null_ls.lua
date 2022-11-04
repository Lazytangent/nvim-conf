local null_ls = require "null-ls"
local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions
local on_attach = require "lsp.regular.on_attach"

local formatting = {
  -- JavaScript/TypeScript
  f.prettier,
  f.eslint_d,

  -- JSON
  f.json_tool,
  f.jq,

  -- Lua
  f.stylua,
  f.lua_format,

  -- Rust
  f.rustfmt,

  -- SQL
  f.sqlformat,

  -- Python
  f.yapf,
  f.autopep8,
  f.black,
  f.isort,

  -- Ruby
  f.rubocop,

  -- CSS/HTML
  f.stylelint,

  -- Go
  f.gofmt,
  f.goimports,

  -- C/C++
  f.clang_format.with {
    filetypes = { "c", "c++", "cpp" },
  },

  f.trim_whitespace.with {
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
}

local linting = {
  -- Python
  d.flake8,

  -- Ruby
  d.rubocop,

  -- Shell
  d.shellcheck,

  -- Codespell
  d.codespell,

  -- TypeScript
  d.tsc,

  -- Go
  d.revive,
  d.staticcheck,
}

local code_actions = {
  ca.gitsigns,
}

local sources = vim.tbl_extend("force", {}, linting, formatting, code_actions)

null_ls.setup {
  sources = sources,
  save_after_format = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  on_attach = on_attach,
}
