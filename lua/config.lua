local config = {}

config.Theming = {
  colorscheme = "catppuccin",
}

config.LSP = {
  enabled        = true,
  highlight_word = true,
  virtual_text   = true,
  servers = {
    primary = {
      "angularls",
      "bashls",
      "cmake",
      "cssls",
      "cucumber_language_server",
      "dockerls",
      "graphql",
      "helm_ls",
      "hls",
      "html",
      "jedi_language_server",
      "kotlin_language_server",
      "ocamllsp",
      "prismals",
      "solargraph",
      "stylelint_lsp",
      "texlab",
      "vimls",
      "volar",
      "zls",
    },
    regular = {
      "basedpyright",
      "pylsp",
      "terraformls",
      "terraform_lsp",
    },
    custom = {
      "beancount",
      "ccls",
      "clangd",
      "deno",
      "go",
      "jsonls",
      "lua",
      "ruff",
      "sourcekit",
      "sql",
      "vue",
      "yaml",
    },
  },
}

config.Completion = {
  enabled = true,
  autopairs = true,
  items = 10,
}

config.Treesitter = {
  disabled_highlighting = { 'latex', 'tex' },
  languages = {
    "bash",
    "beancount",
    "c",
    "clojure",
    "commonlisp",
    "cpp",
    "css",
    "dart",
    "dockerfile",
    "elixir",
    "fennel",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "html",
    "http",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "kotlin",
    "latex",
    "lua",
    "make",
    "ocaml",
    "nu",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scheme",
    "scss",
    "sql",
    "swift",
    "toml",
    "typescript",
    "tsx",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
    "zig",
  }
}

return config
