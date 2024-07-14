local wk = require "which-key"

vim.keymap.set({'n', 'x'}, '<leader>db', 'db#op_exec()', { expr = true })

vim.keymap.set('n', '<leader>de', "db#op_exec() . '_", { expr = true })

wk.add({
  { "<leader>db", desc = 'Execute file' },
  { "<leader>de", desc = "Execute line" },
})

wk.add({
  mode = "x",
  { "<leader>db", desc = "Execute selection" },
})
