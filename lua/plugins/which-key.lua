require("which-key").setup{}

local normal = {
  ["<leader>"] = {
    b = {
      name = "+Buffers",
      a = "Close all other buffers",
      d = "Close buffers",
      l = { "<cmd>bnext<cr>", "next buffer" },
      h = { "<cmd>bprevious<cr>", "prev buffer" },
    },
    c = {
      name = "+Change",
      d = { "<cmd>cd %:h<cr>", "Change working directory" },
      t = { "<cmd>!ctags -R .<cr><cr>", "Ctags" },
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
    r = {
      name = "+Relative number",
      n = {
        name = "+Relative number",
        u = "Toggle relativenumber",
      },
    },
    q = "Quit",
    s = {
      name = "+Spell",
      ["?"] = { "z=", "Spelling suggestions" },
      a = { "zg", "Add word to good spelling list" },
      n = { "]s", "Next bad spelling" },
      p = { "[s", "Prev bad spelling" },
      s = { "<cmd>setlocal spell!<cr>", "Toggle spellcheck" },
    },
    t = {
      name = "+Tabs",
      c = { "<cmd>tabclose<cr>", "Close tab" },
      e = { [[<cmd>tabedit <C-r>=expand("%:p:h")<cr>/]], "Edit tab" },
      m = { "<cmd>tabmove<cr>", "Move tab" },
      n = { "<cmd>tabnew<cr>", "New tab" },
      o = { "<cmd>tabonly<cr>", "Only tab" },
      w = "Tailwind Complete",
    },
    w = "Write",
    x = "Create markdown buffer",
    ["<CR>"] = { "<cmd>nohlsearch<cr>", "Turn off highlight" },
  },
  ["<localleader>"] = {
    a = {
      name = "Add",
      O = { "O<Esc>", "Add new line above" },
      o = { "o<Esc>", "Add new line below" },
    },
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
      n = { "<cmd>set nu!<cr>", "Toggle number" },
      r = { "<cmd>set rnu!<cr>", "Toggle relative" },
    },
    r = { "<cmd>Reload<cr>", "Reload nvim config" },
    w = {
      q = { "<cmd>wq<cr>", "write and quit" },
    },
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
    },
  },
  ["\\"] = {
    name = "Utilities",
    f = "Format",
    w = { "<cmd>w<cr>", "Write" },
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
  ["<C-k>"] = { [[<cmd><C-U>exec "exec 'norm m`' | move -" . (1+v:count1)<cr>]], "Move line up" },
  ["<C-j>"] = { [[<cmd><C-U>exec "exec 'norm m`' | move +" . (0+v:count1)<cr>]], "Move line down" },
  ["<C-n>"] = "Visual Multi",
  ["j"] = { "gj" },
  ["k"] = { "gk" },
}

local comamnd = {
  ["$h"] = { "e ~/", "Edit home" },
  ["$d"] = { "e ~/Desktop", "Edit Desktop" },
  ["$j"] = { "e ./", "Edit here" },
}

local command_opts = {
  mode = "c"
}

local visual = {
  ["<C-k>"] = { [[<cmd><C-U>exec "'<,'>move '<-" . (1+v:count1)<cr>gv]], "Move line up" },
  ["<C-j>"] = { [[<cmd><C-U>exec "'<,'>move '>+" . (0+v:count1)<cr>gv]], "Move line down" },
}

local visual_opts = {
  mode = "v",
}

local wk = require('which-key')

wk.register(normal)
wk.register(visual, visual_opts)
-- wk.register(command, command_opts)
