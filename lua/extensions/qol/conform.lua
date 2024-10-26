return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "stylelint" },
      go = { "goimports", "gofmt" },
      javascript = { "prettier", "eslint_d" },
      json = { "jq" },
      lua = { "stylua" },
      python = { "isort", "black", "ruff_format", "ruff_fix" },
      ruby = { "rubocop" },
      rust = { "rustfmt" },
      sql = { "sql_formatter" },
      terraform = { "terraform_fmt" },
      typescript = { "prettier", "eslint_d" },
      ["*"] = { "trim_whitespace" },
    },
  },
}
