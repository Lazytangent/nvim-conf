local config = {}

config.Theming = {
  colorscheme = "catppuccin",
}

config.LSP = {
  enabled        = true,
  highlight_word = true,
  virtual_text   = true,
  servers = {
    -- Server groupings are just for me to know which servers have custom
    -- settings.
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
      -- "jedi_language_server",
      "kotlin_language_server",
      "ocamllsp",
      "prismals",
      "solargraph",
      "stylelint_lsp",
      "texlab",
      "typst_lsp",
      "vimls",
      "zls",
    },
    regular = {
      "pyrefly",
      "basedpyright",
      "pylsp",
      "terraformls",
      "terraform_lsp",
    },
    custom = {
      "beancount",
      "ccls",
      "clangd",
      "denols",
      "efm",
      "gopls",
      "jsonls",
      "lua_ls",
      "ruff",
      "sourcekit",
      "uv_ty",
      "vuels",
      "yamlls",

      -- "sqlls",
      -- "tsgo",
    },
  },
}

config.Completion = {
  enabled = true,
  autopairs = true,
  items = 10,
}

config.Treesitter = {
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
    "jinja",
    "jq",
    "jsdoc",
    "json",
    "kotlin",
    "latex",
    "lua",
    "make",
    "nu",
    "ocaml",
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
    "tsx",
    "typescript",
    "typst",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
    "zig",
  }
}

return config
