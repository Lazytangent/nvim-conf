return {
  -- {
  --   'luukvbaal/nnn.nvim',
  --   config = true,
  -- },

  {
    'mcchrish/nnn.vim',
    init = function()
      vim.g['nnn#set_default_mappings'] = 0
      vim.g['nnn#layout'] = 'new'
    end,
  },
}
