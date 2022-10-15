vim.opt_local.formatoptions:append('r')
vim.opt_local.comments:remove("fb:-")
vim.opt_local.comments:append(":-")

local wk = require("which-key")

wk.register({
  ["<localleader>"] = {
    n = { "/#+<cr>i<cr><Esc><cmd>nohlsearch<cr>", "Fix code block" },
  },
}, { buffer = 0 })
