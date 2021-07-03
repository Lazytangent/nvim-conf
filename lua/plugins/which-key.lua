require("which-key").setup{}

local normal = {
  ["<leader>"] = {
    b = {
      name = "+Buffers",
      d = { [[<cmd>%bdelete<cr>]], "Close buffers" },
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
      d = "Go to definition",
      i = "Go to implementation",
      r = "Coc-References",
      y = "Go to type definition",
    },
    h = "Prev buffer",
    l = "Next buffer",
    m = {
      name = "+MarkdownPreview",
      d = { [[<cmd>InstantMarkdownPreview<cr>]], "Preview Start" },
      s = { [[<cmd>InstantMarkdownStop<cr>]], "Preview Stop" },
    },
    n = {
      name = "+NvimTree",
      f = { [[<cmd>NvimTreeFindFile<cr>]], "Find" },
      n = { [[<cmd>NvimTreeToggle<cr>]], "Toggle" },
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
      name = "+Git",
      c = { [[<cmd>Git commit<cr>]], "status" },
      l = { [[<cmd>Git pull<cr>]], "pull" },
      p = { [[<cmd>Git push<cr>]], "push" },
      s = { [[<cmd>Git<cr>]], "status" },
      w = { [[<cmd>Git write<cr>]], "write" },
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
    p = { [[<cmd>Prettier<cr>]], "Prettier" },
    r = { "<cmd>Reload<cr>", "Reload nvim config" },
    w = {
      q = { "<cmd>wq<cr>", "write and quit" },
    },
    x = {
      name = "+Trouble",
      d = { [[<cmd>TroubleToggle lsp_document_diagnostics<cr>]], "toggle document diagnostics" },
      l = { [[<cmd>TroubleToggle loclist<cr>]], "toggle location list" },
      q = { [[<cmd>TroubleToggle quickfix<cr>]], "toggle quickfix" },
      w = { [[<cmd>TroubleToggle lsp_workspace_diagnostics<cr>]], "toggle workspace diagnostics" },
      x = { [[<cmd>TroubleToggle<cr>]], "toggle" },
      R = { [[<cmd>TroubleToggle lsp_references<cr>]], "toggle lsp references" },
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
  ["j"] = { "gj", "Down virtual line" },
  ["k"] = { "gk", "Up virtual line" },
  ["t"] = {
    name = "Test",
    ["<C-n>"] = { [[<cmd>TestNearest<cr>]], "Test nearest" },
    ["<C-f>"] = { [[<cmd>TestFile<cr>]], "Test file" },
    ["<C-s>"] = { [[<cmd>TestSuite<cr>]], "Test suite" },
    ["<C-l>"] = { [[<cmd>TestLast<cr>]], "Test last" },
    ["<C-g>"] = { [[<cmd>TestVisit<cr>]], "Test visit" },
  },
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
  ["<S-h>"] = { [[<cmd>DVB_Drag('left')]], "Drag left" },
  ["<S-l>"] = { [[<cmd>DVB_Drag('right')]], "Drag right" },
  ["<S-j>"] = { [[<cmd>DVB_Drag('down')]], "Drag down" },
  ["<S-k>"] = { [[<cmd>DVB_Drag('up')]], "Drag up" },
}

local visual_opts = {
  mode = "v",
}

local wk = require('which-key')

wk.register(normal)
wk.register(visual, visual_opts)
-- wk.register(command, command_opts)
