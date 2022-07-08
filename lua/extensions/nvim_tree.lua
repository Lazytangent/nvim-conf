require('nvim-tree').setup {
  reload_on_bufenter = true,
  diagnostics = {
    enable = true,
  },
  view = {
    side = 'right',
    width = 40,
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
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
}
