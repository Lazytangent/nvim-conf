require("which-key").setup{}

local mappings = {
  ["<leader>"] = {
    b = {
      name = "+Buffers",
      a = "Close all other buffers",
      d = "Close buffers",
    },
    c = {
      name = "+Change",
      d = "Change working directory",
      t = "Ctags",
    },
    f = {
      name = "+Telescope",
      d = "Definitions",
      g = "Git",
      r = "References",
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
      s = "Status",
    },
    h = "Prev buffer",
    l = "Next buffer",
    m = {
      name = "+MarkdownPreview",
      d = "Preview Start",
      s = "Preview Stop",
    },
    n = {
      name = "+NERDTree",
      b = "From Bookmark",
      f = "Find",
      m = "Focus",
      n = "Toggle",
    },
    O = "Add new line above",
    o = "Add new line below",
    r = {
      name = "+Relative number",
      n = {
        name = "+Relative number",
        u = "Toggle relativenumber",
      },
    },
    q = "Quit",
    Q = "Force quit",
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
    w = "Write",
    x = "Create markdown buffer",
    ["<CR>"] = "Turn off highlight",
  },
  ["<localleader>"] = {
    c = {
      t = "Ctags",
    },
    d = "Diagnostics",
    f = {
      name = "+Telescope",
      b = "Find Buffers",
      f = "Find Files",
      g = "Live Grep",
      h = "Help tags",
      p = "Planets",
      t = "Treesitter",
    },
    g = {
      name = "+Coc",
      c = "Commands",
      d = "Defintion",
      i = "Implementation",
      r = "References",
      y = "Type definition",
    },
    m = {
      name = "+More utilities",
      m = "Unix file encoding",
      t = "Timestamp",
    },
    n = {
      name = "+Number",
      n = "Toggle number",
      r = "Toggle relative",
    },
    r = "Reload nvim config",
  },
  ["<space>"] = {
    c = {
      name = "+Code",
      a = "Code action",
    },
    D = "Type definition",
    e = "Show line diagnostics",
    w = {
      name = "+Workspace",
      a = "Add folder",
      l = "List folders",
      r = "Remove folder",
      q = "Write and quit",
    },
  },
  ["g"] = {
    c = "Commentary",
    D = "Go to declaration",
    d = "Go to definition",
    i = "Go to implementation",
    r = "References",
    s = "Sort motion",
  },
  ["K"] = "Hover",
  ["<C-h>"] = "Signature help",
  ["["] = {
    d = "Go to prev diagnostic",
  },
  ["]"] = {
    d = "Go to next diagnostic",
  },
  ["<C-B>"] = "Back up a page",
  ["<C-F>"] = "Forward down a page",
  ["<C-D>"] = "Down half a page",
  ["<C-U>"] = "Up half a page",
  ["<C-k>"] = "Move line up",
  ["<C-j>"] = "Move line down",
  ["<C-n>"] = "Visual Multi",
}

local wk = require('which-key')

wk.register(mappings)
