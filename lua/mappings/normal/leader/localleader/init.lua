local f = require('mappings.normal.leader.localleader.f')
local l = require('mappings.normal.leader.localleader.l')

local localleader = {
  name = "+Local leader",
  e = { [[:e<cr>]], "Edit file" },
  f = f,
  g = { [[<cmd>lua require('plugins.telescope').grep_prompt()<cr>]], "Grep String" },
  l = l,
  p = {
    name = "+LSP Pickers",
    c = "LSP Code Actions",
    e = "LSP References",
    i = "LSP Implementations",
    r = "LSP Rename",
    t = "LSP Type Definition",

    w = {
      name = "+Workspace Folders",
      a = "Add workspace folder",
      r = "Remove workspace folder",
      l = "List workspace folders",
    },
  },
  t = {
    name = "+TableMode",
    m = "Toggle table mode",
    t = "Tableize",
  },
  ["<CR>"] = { [[<cmd>nohlsearch<cr>]], "Turn off highlight" },
}

return localleader
