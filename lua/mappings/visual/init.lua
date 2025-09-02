local dial_map = require "dial.map"

local visual = {
  {
    "g<C-a>",
    function()
      dial_map.manipulate("increment", "gvisual")
    end,
    desc = "Increment with dial"
  },
  {
    "g<C-x>",
    function()
      dial_map.manipulate("decrement", "gvisual")
    end,
    desc = "Decrement with dial"
  },

  {
    "<C-a>",
    function()
      dial_map.manipulate("increment", "visual")
    end,
    desc = "Increment with dial",
  },
  {
    "<C-x>",
    function()
      dial_map.manipulate("decrement", "visual")
    end,
    desc = "Decrement with dial"
  },

  { "gy", desc = "Gitlinker" },

  { "<C-k>", [[:<C-U>exec "'<,'>move '<-" . (1+v:count1)<cr>gv]], desc = "Move line up" },
  { "<C-j>", [[:<C-U>exec "'<,'>move '>+" . (0+v:count1)<cr>gv]], desc = "Move line down" },

  { "<S-h>", [[<cmd>DVB_Drag('left')]], desc = "Drag left" },
  { "<S-l>", [[<cmd>DVB_Drag('right')]], desc = "Drag right" },
  { "<S-j>", [[<cmd>DVB_Drag('down')]], desc = "Drag down" },
  { "<S-k>", [[<cmd>DVB_Drag('up')]],  desc = "Drag up" },
}

return visual
