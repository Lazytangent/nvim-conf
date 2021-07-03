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
      c = { [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], "colorscheme" },
      d = { "<cmd>cd %:h<cr>", "Change working directory" },
      t = { "<cmd>!ctags -R .<cr><cr>", "Ctags" },
    },
    f = {
      name = "+Telescope",
      b = { [[<cmd>lua require('telescope.builtin').file_browser()<cr>]], "file browser" },
      d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "definitions" },
      f = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], "fuzzy find" },
      g = { [[<cmd>lua require('telescope.builtin').git_status()<cr>]], "Git" },
      r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "References" },
      t = { [[<cmd>lua require('telescope.builtin').tags()<cr>]], "tags" },
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
    f = {
      name = "+Telescope",
      b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "Find Buffers" },
      c = { [[<cmd>lua require('telescope.builtin').commands()<cr>]], "commands" },
      d = { [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>]], "document diagnostics" },
      f = { [[<cmd>lua require('telescope.builtin').find_files()<cr>]], "Find files" },
      g = { [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], "live grep" },
      h = { [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], "help tags" },
      l = { [[<cmd>lua require('telescope.builtin').loclist()<cr>]], "location list" },
      p = { [[<cmd>lua require('telescope.builtin').planets()<cr>]], "planets" },
      q = { [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], "quickfix list" },
      r = { [[<cmd>lua require('telescope.builtin').registers()<cr>]], "registers" },
      t = { [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], "treesitter" },
    },
    g = {
      name = "+Git",
      c = { [[<cmd>Git commit<cr>]], "status" },
      l = { [[<cmd>Git pull<cr>]], "pull" },
      p = { [[<cmd>Git push<cr>]], "push" },
      s = { [[<cmd>Git<cr>]], "status" },
      w = { [[<cmd>Gw<cr>]], "write" },
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
