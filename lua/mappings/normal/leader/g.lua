local gitsigns = require 'gitsigns'

return {
  { "<leader>g",  group = "Git" },
  { "<leader>gg", "<cmd>Git<cr>",    desc = "status" },
  { "<leader>gs", "<cmd>Neogit<cr>", desc = "status" },

  { "<leader>gt",  group = "Gitsigns" },
  { "<leader>gtb", gitsigns.toggle_current_line_blame, desc = "Toggle blame" },
  { "<leader>gtd", gitsigns.toggle_deleted,            desc = "Toggle deleted" },
  { "<leader>gtn", gitsigns.toggle_numhl,              desc = "Toggle number hl" },
  { "<leader>gtp", gitsigns.preview_hunk,              desc = "Preview Hunk" },
  { "<leader>gts", gitsigns.toggle_signs,              desc = "Toggle signs" },
  { "<leader>gtw", gitsigns.toggle_word_diff,          desc = "Toggle word diff" },
}
