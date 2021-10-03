vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '*.pyc'}
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_disable_window_picker = 1

require('nvim-tree').setup {
  auto_close = true,
  view = {
    side = 'right',
  },
}
