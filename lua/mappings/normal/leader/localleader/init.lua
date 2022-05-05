local f = require('mappings.normal.leader.localleader.f')
local l = require('mappings.normal.leader.localleader.l')

local localleader = {
  name = "+Local leader",
  e = { [[:e<cr>]], "Edit file" },
  f = f,
  g = { [[<cmd>lua require('plugins.telescope').grep_prompt()<cr>]], "Grep String" },
  l = l,
  p = { [[:25split | term pre-commit run --files %<cr>]], "Run pre-commit on the current file in a terminal split" },
  t = {
    name = "+TableMode",
    m = "Toggle table mode",
    t = "Tableize",
  },
  ["<CR>"] = { [[<cmd>nohlsearch<cr>]], "Turn off highlight" },
}

return localleader
