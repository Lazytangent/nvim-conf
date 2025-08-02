return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    view = {
      merge_tool = {
        -- diff1_plain
        -- diff3_horizontal
        -- diff4_mixed
        layout = "diff3_mixed",
      },
    },
    keymaps = {
      view = {
        { "n", "q", function() require("diffview.actions").close() end, { desc = "Close help menu" } },
      },
      file_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
      },
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
      },
    },
  },
}
