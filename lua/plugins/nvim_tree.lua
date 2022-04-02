require('nvim-tree').setup {
  diagnostics = {
    enable = true,
  },
  view = {
    side = 'right',
  },
  filters = {
    custom = {'.git', '.gitignore'}
  },
  git = {
    enable = true,
    ignore = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
}
