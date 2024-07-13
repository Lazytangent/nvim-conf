local leader = require('mappings.visual.leader')

local visual = {
  { "g<C-a>", require("dial.map").inc_gvisual(), desc = "Increment with dial" },
  { "<gC-x>", require("dial.map").dec_gvisual(), desc = "Decrement with dial" },

  { "<C-a>", require("dial.map").inc_visual(), desc = "Increment with dial" },
  { "<C-k>", [[:<C-U>exec "'<,           '>move '<-" . (1+v:count1)<cr>gv]], desc = "Move line up" },
  { "<C-j>", [[:<C-U>exec "'<,           '>move '>+" . (0+v:count1)<cr>gv]], desc = "Move line down" },
  { "<C-x>", require("dial.map").dec_visual(), desc = "Decrement with dial" },
  { "<S-h>", [[<cmd>DVB_Drag('left')]], desc = "Drag left" },
  { "<S-l>", [[<cmd>DVB_Drag('right')]], desc = "Drag right" },
  { "<S-j>", [[<cmd>DVB_Drag('down')]], desc = "Drag down" },
  { "<S-k>", [[<cmd>DVB_Drag('up')]],  desc = "Drag up" },

  leader,
}

return visual
