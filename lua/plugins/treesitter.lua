require('nvim-treesitter.configs').setup {
  ensure_installed = Treesitter.parsers,
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    disable = {},
  },
  indent = { enable = true },
  rainbow = { enable = Treesitter.rainbow },
  textobjects = { enable = true },
  incremental_selection = { enable = true },
}
