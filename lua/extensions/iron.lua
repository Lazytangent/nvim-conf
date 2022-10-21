local iron = require("iron.core")

iron.setup {
  config = {
    scratch_repl    = true,
    repl_definition = {},
    repl_open_cmd   = require("iron.view").bottom(40),
  },
  keymaps = {
    send_motion = "<leader>sc",
    visual_send = "<leader>sc",
    send_file   = "<leader>sf",
    send_line   = "<leader>sl",
    cr          = "<leader>s<cr>",
    exit        = "<leader>sq",
    clear       = "<leader>sC",
  },
}
