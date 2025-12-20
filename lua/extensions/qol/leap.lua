return {
  {
    'ggandor/leap.nvim',
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'o'}, 'S', '<Plug>(leap-backward)')
      vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
    end,
  },
  -- {
  --   'ggandor/flit.nvim',
  --   config = true,
  -- },
}
