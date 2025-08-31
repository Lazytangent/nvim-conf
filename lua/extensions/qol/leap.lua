return {
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_mappings()
    end,
  },
  {
    'ggandor/flit.nvim',
    config = true,
  },
}
