return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require 'extensions.qol.configs.gitsigns'
  end,
}
