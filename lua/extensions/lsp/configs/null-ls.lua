local null_ls = require "null-ls"
local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions
local on_attach = require "lsp.regular.on_attach"

local formatting = {
  -- JavaScript/TypeScript
  f.prettier,

  -- JSON
  require("none-ls.formatting.jq"),

  -- Lua
  f.stylua,

  -- Rust
  require("none-ls.formatting.rustfmt"),

  -- SQL
  f.sqlformat,

  -- Python
  f.yapf,
  require("none-ls.formatting.autopep8"),
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

  -- Kotlin
  f.ktlint,
}

local linting = {
  -- Ruby
  d.rubocop,

  -- Shell
  require("none-ls-shellcheck.diagnostics"),

  -- Codespell
  d.codespell,

  -- Go
  d.revive,
  d.staticcheck,

  -- Kotlin
  d.ktlint,
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
