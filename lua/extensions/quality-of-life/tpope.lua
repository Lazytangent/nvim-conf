return {
  {
    "tpope/vim-abolish",
    config = function()
      -- Abolish abbreviations
      vim.cmd [[
        Abolish fex for example
        Abolish proc{,s} procedure{,s}
      ]]
    end,
  },
  { "tpope/vim-eunuch" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  {
    'tpope/vim-sleuth',
    config = function()
      vim.g.sleuth_heuristics = 0
    end,
  },
  {
    "tpope/vim-unimpaired",
  },
}
