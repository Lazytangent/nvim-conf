local leader = require('mappings.visual.leader')

local visual = {
  ["<C-k>"] = { [[:<C-U>exec "'<,           '>move '<-" . (1+v:count1)<cr>gv]], "Move line up" },
  ["<C-j>"] = { [[:<C-U>exec "'<,           '>move '>+" . (0+v:count1)<cr>gv]], "Move line down" },
  ["<S-h>"] = { [[<cmd>DVB_Drag('left')]],  "Drag left" },
  ["<S-l>"] = { [[<cmd>DVB_Drag('right')]], "Drag right" },
  ["<S-j>"] = { [[<cmd>DVB_Drag('down')]],  "Drag down" },
  ["<S-k>"] = { [[<cmd>DVB_Drag('up')]],    "Drag up" },

  ["<leader>"] = leader,
}

return visual
