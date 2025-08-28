return {
  { "tpope/vim-abolish", },
  { "tpope/vim-eunuch" },
  { "tpope/vim-repeat" },
  {
    'tpope/vim-sleuth',
    config = function()
      vim.g.sleuth_heuristics = 0
    end,
  },
  { "tpope/vim-unimpaired", },
}
