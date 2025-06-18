return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    disable_insert_on_commit = true,
    mappings = {
      status = {
        ["]]"] = "NextSection",
        ["[["] = "PreviousSection",
      },
    },
  },
  event = "VeryLazy",
}
