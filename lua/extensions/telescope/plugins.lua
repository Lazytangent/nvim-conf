return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "benfowler/telescope-luasnip.nvim",
    },
    config = function()
      require 'extensions.telescope.configs.telescope'
    end,
    event = "VeryLazy",
  },
}
