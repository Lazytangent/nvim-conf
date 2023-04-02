return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require 'extensions.telescope.config'
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "tami5/sqlite.lua" },
  },
  "nvim-telescope/telescope-dap.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-project.nvim",
  "benfowler/telescope-luasnip.nvim",
}
