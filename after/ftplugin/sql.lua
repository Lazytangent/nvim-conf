local wk = require "which-key"

vim.keymap.set({'n', 'x'}, '<leader>db', 'db#op_exec()', { expr = true })

vim.keymap.set('n', '<leader>de', "db#op_exec() . '_", { expr = true })

wk.register({
  ["<leader>d"] = {
    b = 'Execute file',
    e = "Execute line",
  },
})

wk.register({
  ["<leader>db"] = "Execute selection",
}, { mode = "x" })
