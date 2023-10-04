local leader = require('mappings.normal.leader')

local normal = {
  ["<leader>"] = leader,
  ["j"] = { [[v:count == 0 ? 'gj' : 'j']], "Up (virtual) line",   expr = true },
  ["k"] = { [[v:count == 0 ? 'gk' : 'k']], "Down (virtual) line", expr = true },
  ["K"] = "Hover",
  ["y"] = {
    o = {
      name = "+option",
      b = "background",
      c = "cursorline",
      d = "diff",
      h = "hlsearch",
      i = "ignorecase",
      l = "list",
      m = { [[<cmd>set modifiable<cr>]], "Set modifiable" },
      n = "number",
      r = "relativenumber",
      s = "spell",
      u = "cursorcolumn",
      v = "virtualedit",
      w = "wrap",
      x = "crosshairs",
      z = { [[<cmd>if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<cr>]], "Toggle syntax" },
    },
  },
  ["*"] = { [[*``]], "*" },
  ["#"] = { [[#``]], "#" },
  ["["] = {
    d = "Go to prev diagnostic",
    e = "Go to prev error level diagnostic",

    a = "Prev arg",
    A = "First arg",
    b = "Prev block start",
    B = "Prev block end",
    c = "Prev conditional start",
    C = "Prev conditional end",
    h = "Prev hunk",
    l = "Prev loop start",
    L = "Prev loop end",
    ["<C-L>"] = "Last error of prev file in loclist",
    q = "Prev quickfix list item",
    Q = "First quickfix list item",
    ["<C-Q>"] = "Last error of prev file in quickfix",
    t = "Prev tag",
    T = "First tag",
    ["<C-T>"] = "Prev tag in previous window",
    f = "Previous file (alphabetically)",
    n = "Previous SCM conflict marker",
    ["<Space>"] = "Add line above",
    o = {
      name = "+options",
      b = "set background light",
      c = "set cursorline on",
      d = "set diff on",
      h = "set hlsearch on",
      i = "set ignorecase on",
      l = "set list on",
      n = "set number on",
      r = "set relativenumber on",
      s = "set spell on",
      u = "set cursorcolumn on",
      v = "set virtualedit on",
      w = "set wrap on",
      x = "set crosshairs on",
    },
    ["["] = "Prev class start",
    ["]"] = "Prev class end",
  },
  ["]"] = {
    d = "Go to next diagnostic",
    e = "Go to next error level diagnostic",

    a = "Next arg",
    A = "First arg",
    b = "Next block start",
    B = "Next block end",
    c = "Next conditional start",
    C = "Prev conditional end",
    E = "Next call start",
    h = "Next hunk",
    l = "Next location list item",
    L = "Last location list item",
    ["<C-L>"] = "First error of next file in loclist",
    q = "Next quickfix list item",
    Q = "Last quickfix list item",
    ["<C-Q>"] = "First error of next file in quickfix",
    t = "Next tag",
    T = "Last tag",
    ["<C-T>"] = "Next tag in previous window",
    f = "Next file (alphabetically)",
    n = "Next SCM conflict marker",
    ["<Space>"] = "Add line below",
    o = {
      name = "+options",
      b = "set background dark",
      c = "set cursorline off",
      d = "set diff off",
      h = "set hlsearch off",
      i = "set ignorecase off",
      l = "set list off",
      n = "set number off",
      s = "set spell off",
      r = "set relativenumber off",
      u = "set cursorcolumn off",
      v = "set virtualedit off",
      w = "set wrap off",
      x = "set crosshairs off",
    },
    ["["] = "Next class start",
    ["]"] = "Next class end",
  },
  ["<C-a>"] = { require("dial.map").inc_normal(), "Increment with dial" },
  ["<C-B>"] = "Back up a page",
  ["<C-F>"] = "Forward down a page",
  ["<C-D>"] = "Down half a page",
  ["<C-h>"] = "Signature help",
  ["<C-k>"] = { [[:<C-U>exec "exec 'norm m`' | move -" . (1+v:count1)<cr>]], "Move line up" },
  ["<C-j>"] = { [[:<C-U>exec "exec 'norm m`' | move +" . (0+v:count1)<cr>]], "Move line down" },
  ["<C-U>"] = "Up half a page",
  ["<C-w>"] = {
    name = "+Window commands",
    d = { [[<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<cr>]], "Vertical split and Go to definition" },
  },
  ["<C-x>"] = { require("dial.map").dec_normal(), "Decrement with dial" },
  ["c"] = {
    name = "Change",
    ["*"] = { [[/\<<C-r>=expand('<cword>')<cr>\>\C<cr>``cgn]], "Word and search forward" },
    ["#"] = { [[?\<<C-r>=expand('<cword>')<cr>\>\C<cr>``cgN]], "Word and search backward" },

    i = {
      name = "Inner",
      d = "Org: Change inner date",
      r = "Org: Increase priority of headline",
      R = "Org: Decrease priority of headline",
      t = "Org: Cycle TODO forwards",
      T = "Org: Cycle TODO backwards",
    },
  },
  ["d"] = {
    name = "Delete",
    ["*"] = { [[/\<<C-r>=expand('<cword>')<cr>\>\C<cr>``dgn]], "Word and search forward" },
    ["#"] = { [[?\<<C-r>=expand('<cword>')<cr>\>\C<cr>``dgN]], "Word and search backward" },
  },
}

return normal
