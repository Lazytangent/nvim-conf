require('nvim-treesitter.configs').setup {
  ensure_installed = Treesitter.parsers,
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    disable = {},
    custom_captures = {
      ["%81v"] = "Error",
    },
    textobjects = { enable = true },
  },
  indent = { enable = true },
  rainbow = { enable = Treesitter.rainbow },
  textobjects = { enable = true },
  incremental_selection = { enable = true },
}
