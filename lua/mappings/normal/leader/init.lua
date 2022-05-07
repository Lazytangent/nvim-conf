local d = require('mappings.normal.leader.d')
local f = require('mappings.normal.leader.f')
local g = require('mappings.normal.leader.g')
local localleader = require('mappings.normal.leader.localleader')

local leader = {
  ["<leader>"] = {
    name = "+LSP",
    c = {
      name = "+Utilities",
      l = { [[<cmd>lua require('telescope').extensions.luasnip.luasnip()<cr>]], "Telescope: LuaSnip" },
    },
    d = {
      name = "+Textobjects peek",
      c = "Outer class",
      f = "Outer function",
    },
    l = {
      name = "+LSP",
      c = "Code action",
      d = "Definition",
      D = "Declaration",
      r = "References",
      t = "Type definition",
    },
    r = "Rename",
    w = {
      name = "+LSP Workspace",
      a = "Add workspace folder",
      r = "Remove workspace folder",
      l = "List workspace folders",
    }
  },
  [","] = {
    name = "+Utilities",
    f = { [[<cmd>lua vim.lsp.buf.formatting()<cr>]], "Format" },
    g = { [[:set operatorfunc=GrepOperator<cr>g@]], "Grep for word under cursor" },
    p = { [[<cmd>lua require('yabs'):run_task('pre_commit')<cr>]], "Run pre-commit on current file" },
    r = { [[<cmd>lua require('mdeval').eval_code_block()<cr>]], "Run code block with mdeval" },
    t = {
      name = "+Terminal",
      b = { [[:15split | term<cr>]], "Bottom terminal" },
      n = { [[:Term<cr>]], "25 height botton" },
    },
    [","] = { [[<c-^>]], "Last buffer" },
    ["*"] = { [[*<C-O>:%s///gn<cr>]], "Count matches" },
  },
  a = {
    name = "+Add/Arglist",
    a = { [[<cmd>args<cr>]], "Print arglist" },
    n = { [[<cmd>next<cr>]], "Next file in arglist" },
    O = { [[O<Esc>]], "Add new line above" },
    o = { [[o<Esc>]], "Add new line below" },
    p = { [[<cmd>prev<cr>]], "Prev file in arglist" },
  },
  b = {
    name = "+Buffers",
    d = { [[<cmd>%bdelete<cr>]], "Close buffers" },
    l = { [[<cmd>bnext<cr>]], "Next buffer" },
    h = { [[<cmd>bprevious<cr>]], "Prev buffer" },
  },
  c = {
    name = "+Change",
    c = { [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], "colorscheme" },
    d = { [[<cmd>cd %:p:h<cr>]], "Change working directory" },
  },
  d = d,
  e = "Show line diagnostics",
  f = f,
  g = g,
  l = {
    name = "+Lists",
    c = { [[:changes<cr>]], "Show changes" },
    g = { [[:LazyGit<cr>]], "LazyGit" },
    j = { [[:jumps<cr>]], "Show jumps" },
    l = { [[:ls<cr>:b]], "Select buffer" },
    m = { [[:marks<cr>:normal! `]], "Show marks" },
  },
  m = localleader,
  o = {
    name = "+Open",
    c = { [[<cmd>copen<cr>]], "Quickfix" },
    l = { [[<cmd>lopen<cr>]], "Location" },
    p = { [[<cmd>NvimTreeFocus<cr>]], "Project in NvimTree" },
  },
  p = {
    name = "+LSP Pickers",
    c = {
      name = "+Code Actions",
      c = { [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]], "at Cursor" },
      r = { [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>]], "on Range" },
    },
    d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "Definitions" },
    i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "Implementations" },
    r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "References" },
    s = {
      name = "+Symbols",
      d = { [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]], "Document" },
      w = { [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>]], "Workspace" },
      y = { [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>]], "Dyanmic workspace" },
    },
    t = { [[<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>]], "Type Definitions" },

    D = {
      name = "+Diagnostics",
      d = { [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>]], "Document" },
      w = { [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>]], "Workspace" },
    },
  },
  q = "Set diagnostics into location list",
  s = {
    name = "+Spell",
    s = { [[<cmd>setlocal spell!<cr>]], "Toggle spellcheck" },
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
  ["`"] = { [[<C-^>]], "Prev buffer" },
}

return leader
