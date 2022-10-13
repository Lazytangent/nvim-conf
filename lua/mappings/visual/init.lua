local leader = require('mappings.visual.leader')
local utils = require("mappings.utils")

local visual = {
  g = {
    ["<C-a>"] = { utils.lua_require("dial.map", "inc_gvisual()"), "Increment with dial" },
    ["<C-x>"] = { utils.lua_require("dial.map", "dec_gvisual()"), "Decrement with dial" },
  },

  ["<C-a>"] = { utils.lua_require("dial.map", "inc_visual()"), "Increment with dial" },
  ["<C-k>"] = { [[:<C-U>exec "'<,           '>move '<-" . (1+v:count1)<cr>gv]], "Move line up" },
  ["<C-j>"] = { [[:<C-U>exec "'<,           '>move '>+" . (0+v:count1)<cr>gv]], "Move line down" },
  ["<C-x>"] = { utils.lua_require("dial.map", "dec_visual()"), "Decrement with dial" },
  ["<S-h>"] = { [[<cmd>DVB_Drag('left')]],  "Drag left" },
  ["<S-l>"] = { [[<cmd>DVB_Drag('right')]], "Drag right" },
  ["<S-j>"] = { [[<cmd>DVB_Drag('down')]],  "Drag down" },
  ["<S-k>"] = { [[<cmd>DVB_Drag('up')]],    "Drag up" },

  ["<leader>"] = leader,
}

return visual
