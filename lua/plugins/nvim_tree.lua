vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_disable_window_picker = 1

require('nvim-tree').setup {
  auto_close = true,
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
}
