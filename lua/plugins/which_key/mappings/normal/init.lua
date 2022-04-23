local leader = require('plugins.which_key.mappings.normal.leader')

local normal = {
  ["<leader>"] = leader,
  ["g"] = {
    c = "Comment.nvim",

    -- LSP Stuff
    d = "Go to defintion",
    D = "Go to declaration",
  },
  ["j"] = { [[v:count == 0 ? 'gj' : 'j']], "Up (virtual) line", expr = true },
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
      n = "number",
      r = "relativenumber",
      s = "spell",
      u = "cursorcolumn",
      v = "virtualedit",
      w = "wrap",
      x = "crosshairs",
    },
  },
  ["*"] = { [[*``]], "*" },
  ["#"] = { [[#``]], "#" },
  ["["] = {
    d = "Go to prev diagnostic",

    a = "Prev arg",
    A = "First arg",
    b = "Prev buffer",
    B = "First buffer",
    l = "Prev location list item",
    L = "First location list item",
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
    e = "Exchange with above",
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
  },
  ["]"] = {
    d = "Go to next diagnostic",

    a = "Next arg",
    A = "First arg",
    b = "Next buffer",
    B = "Last buffer",
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
    e = "Exchange with below",
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
  },
  ["<C-B>"] = "Back up a page",
  ["<C-F>"] = "Forward down a page",
  ["<C-D>"] = "Down half a page",
  ["<C-h>"] = "Signature help",
  ["<C-k>"] = { [[:<C-U>exec "exec 'norm m`' | move -" . (1+v:count1)<cr>]], "Move line up" },
  ["<C-j>"] = { [[:<C-U>exec "exec 'norm m`' | move +" . (0+v:count1)<cr>]], "Move line down" },
  ["<C-U>"] = "Up half a page",
  ["c"] = {
    name = "Change",
    ["*"] = { [[/\<<C-r>=expand('<cword>')<cr>\>\C<cr>``cgn]], "Word and search forward" },
    ["#"] = { [[?\<<C-r>=expand('<cword>')<cr>\>\C<cr>``cgN]], "Word and search backward" },
  },
  ["d"] = {
    name = "Delete",
    ["*"] = { [[/\<<C-r>=expand('<cword>')<cr>\>\C<cr>``dgn]], "Word and search forward" },
    ["#"] = { [[?\<<C-r>=expand('<cword>')<cr>\>\C<cr>``dgN]], "Word and search backward" },
  },
}

return normal
