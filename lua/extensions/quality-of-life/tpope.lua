return {
  { "tpope/vim-eunuch" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "tpope/vim-unimpaired" },
  {
    'tpope/vim-sleuth',
    config = function()
      vim.g.sleuth_heuristics = 0
    end,
  },
}
