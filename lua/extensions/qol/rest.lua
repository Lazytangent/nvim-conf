return {
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   config = function()
  --     require('telescope').load_extension('rest')
  --   end,
  --   dependencies = {
  --     'nvim-telescope/telescope.nvim',
  --   },
  -- },

  {
    "mistweaverco/kulala.nvim",
    ft = {"http", "rest"},
    opts = {
      default_env = "local",
    },
  },
}
