require("which-key").setup{}

local mappings = {
  ["<leader>"] = {
    a = {
      name = "+ALE",
      F = "ALE Fix",
      I = "ALE Info",
    },
    b = {
      name = "+Buffers",
      a = "Close all other buffers",
      d = "Close buffers",
    },
    c = {
      name = "+Change",
      d = "Change working directory",
    },
    f = {
      name = "+Telescope",
      b = "Find buffer",
      f = "Find files",
      g = "Grep",
      h = "Help",
    },
    g = {
      name = "+Git and Goto",
      c = "Git commit",
      d = "Go to definition",
      i = "Go to implementation",
      l = "Git pull",
      p = "Git push",
      r = "Coc-References",
      w = "Write and Add",
      y = "Go to type definition",
      s = {
        name = "+Git status",
        t = "Git status",
      },
    },
    n = {
      name = "+NERDTree",
      b = "From Bookmark",
      f = "Find",
      m = "Focus",
      n = "Toggle",
    },
    p = {
      name = "+Prettier and paste",
      p = "Toggle pastemode",
      y = "Run Prettier",
    },
    r = {
      name = "+Relative number",
      n = {
        name = "+Relative number",
        u = "Toggle relativenumber",
      },
    },
    s = {
      name = "+Spell",
      ["?"] = "Spelling suggestions",
      a = "Add word to good spelling list",
      n = "Next bad spelling",
      p = "Prev bad spelling",
      s = "Toggle spellcheck",
    },
    t = {
      name = "+Tabs",
      c = "Close tab",
      e = "Edit tab",
      m = "Move tab",
      n = "New tab",
      o = "Only tab",
      w = "Tailwind Complete",
    },
    u = {
      name = "+Undo Fold",
      f = "Unfold",
    },
    ["<CR>"] = "Turn off highlight",
    h = "Prev buffer",
    l = "Next buffer",
    m = "Timestamp",
    O = "Add new line above",
    o = "Add new line below",
    q = "Quit",
    Q = "Force quit",
    w = "Write",
    x = "Create markdown buffer",
    ["<C-k>"] = "Move line up",
    ["<C-j>"] = "Move line down",
    ["<C-n>"] = "Visual Multi",
    ["<C-y>"] = {
      name = "+Emmet",
      [","] = "Expand abbr",
      ["/"] = "Toggle comment",
      [";"] = "Expand word",
      a = "Anchorize url",
      A = "Anchorize summary",
      D = "Balance tag outword",
      d = "Balance tag inward",
      I = "Image encode",
      i = "Image size",
      j = "Split join tag",
      k = "Remove tag",
      m = "Merge lines",
      N = "Move prev",
      n = "Move next",
      u = "Update tag",
    },
  },
  ["<localleader>"] = {
    r = "Reload nvim config",
  },
  ["g"] = {
    D = "Go to declaration",
    d = "Go to definition",
    i = "Go to implementation",
  },
  ["K"] = "Hover",
  ["<C-k>"] = "Signature help",
  ["<space>"] = {
    w = {
      name = "+Workspace",
      a = "Add folder",
      r = "Remove folder",
      l = "List folders",
    },
    D = "Type definition",
  },
}

local wk = require('which-key')

wk.register(mappings)
