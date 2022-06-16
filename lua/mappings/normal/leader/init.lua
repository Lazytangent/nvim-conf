local d = require('mappings.normal.leader.d')
local f = require('mappings.normal.leader.f')
local g = require('mappings.normal.leader.g')
local o = require('mappings.normal.leader.o')
local localleader = require('mappings.normal.leader.localleader')

local telescope_builtin = [[<cmd>lua require('telescope.builtin').]]

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
    w = {
      name = "+LSP Workspace",
      a = "Add workspace folder",
      r = "Remove workspace folder",
      l = "List workspace folders",
    }
  },
  [","] = {
    name = "+Utilities",
    d = {
      name = "+Diagnostics",
      h = { [[<cmd>lua vim.diagnostic.disable(nil, 0)<cr>]], "Hide diagnostics in buffer" },
      s = { [[<cmd>lua vim.diagnostic.enable(nil, 0)<cr>]], "Show diagnostics in buffer" },
    },
    f = { [[<cmd>lua vim.lsp.buf.format({ async = true })<cr>]],               "Format" },
    g = { [[:set operatorfunc=GrepOperator<cr>g@]],                "Grep for word under cursor" },
    p = { [[<cmd>lua require('yabs'):run_task('pre_commit')<cr>]], "Run pre-commit on current file" },
    t = {
      name = "+Terminal",
      b = { [[:15split | term<cr>]], "Bottom terminal" },
      n = { [[:Term<cr>]],           "25 height bottom" },
    },
    [",                               "] = { [[<c-^>]], "Last buffer" },
    ["*"] = { [[*<C-O>:%s///gn<cr>]], "Count matches" },
  },
  a = {
    name = "+Add/Arglist",
    a = { [[<cmd>args<cr>]], "Print arglist" },
    n = { [[<cmd>next<cr>]], "Next file in arglist" },
    O = { [[O<Esc>]],        "Add new line above" },
    o = { [[o<Esc>]],        "Add new line below" },
    p = { [[<cmd>prev<cr>]], "Prev file in arglist" },
  },
  b = {
    name = "+Buffers",
    d = { [[<cmd>%bdelete<cr>]],                  "Close buffers" },
    l = { telescope_builtin .. [[buffers()<cr>]], "List buffers" },
    n = { [[<cmd>bnext<cr>]],                     "Next buffer" },
    p = { [[<cmd>bprevious<cr>]],                 "Prev buffer" },
  },
  c = {
    name = "+Change",
    c = { telescope_builtin .. [[colorscheme()<cr>]], "colorscheme" },
    d = { [[<cmd>cd %:p:h<cr>]],                      "Change working directory" },
  },
  d = d,
  e = "Show line diagnostics",
  f = f,
  g = g,
  h = {
    name = "+Help",
    h = { telescope_builtin .. [[help_tags()<cr>]], "Help Tags" },
  },
  l = {
    name = "+LagyGit",
    g = { [[:LazyGit<cr>]], "LazyGit" },
  },
  m = localleader,
  o = o,
  p = {
    name = "+LSP Pickers",
    c = {
      name = "+Code Actions",
      c = { telescope_builtin .. [[lsp_code_actions()<cr>]],       "at Cursor" },
      r = { telescope_builtin .. [[lsp_range_code_actions()<cr>]], "on Range" },
    },
    d = { telescope_builtin .. [[lsp_definitions()<cr>]],     "Definitions" },
    i = { telescope_builtin .. [[lsp_implementations()<cr>]], "Implementations" },
    r = { telescope_builtin .. [[lsp_references()<cr>]],      "References" },
    s = {
      name = "+Symbols",
      d = { telescope_builtin .. [[lsp_document_symbols()<cr>]],          "Document" },
      w = { telescope_builtin .. [[lsp_workspace_symbols()<cr>]],         "Workspace" },
      y = { telescope_builtin .. [[lsp_dynamic_workspace_symbols()<cr>]], "Dynamic workspace" },
    },
    t = { telescope_builtin .. [[lsp_type_definitions()<cr>]], "Type Definitions" },

    D = {
      name = "+Diagnostics",
      d = { telescope_builtin .. [[lsp_document_diagnostics()<cr>]],  "Document" },
      w = { telescope_builtin .. [[lsp_workspace_diagnostics()<cr>]], "Workspace" },
    },
  },
  q = "Set diagnostics into location list",
  r = {
    name = "Run tests",
    a = { [[<cmd>lua require('neotest').run.attach()<cr>]],                  "Attach to nearest test" },
    d = { [[<cmd>lua require('neotest').run.run({ strategy = "dap" })<cr>]], "Debug nearest test" },
    f = { [[<cmd>lua require('neotest').run.run()<cr>]],                     "Current file" },
    o = { [[<cmd>lua require('neotest').output.open({ enter = true })<cr>]], "Open output" },
    s = { [[<cmd>lua require('neotest').run.stop()<cr>]],                    "Stop test" },
    t = { [[<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>]],   "Nearest test" },

    m = {
      name = "Summary",
      c = { [[<cmd>lua require('neotest').summary.close()<cr>]],  "Close summary" },
      o = { [[<cmd>lua require('neotest').summary.open()<cr>]],   "Open summary" },
      m = { [[<cmd>lua require('neotest').summary.toggle()<cr>]], "Toggle summary" },
      t = { [[<cmd>lua require('neotest').summary.toggle()<cr>]], "Toggle summary" },
    },
  },
  s = {
    name = "+Spell",
    s = { [[<cmd>setlocal spell!<cr>]], "Toggle spellcheck" },
  },
  t = {
    name = "+Tabs and Table Mode",
    c = { [[<cmd>tabclose<cr>]],  "Close tab" },
    e = { [[<cmd>tabedit<cr>]],   "Open a new tab" },
    h = { [[<cmd>tabmove -<cr>]], "Move tab left" },
    l = { [[<cmd>tabmove +<cr>]], "Move tab right" },
    m = "Table Mode Toggle",
    n = { [[<cmd>tabnext<cr>]], "Next tab" },
    o = { [[<cmd>tabnew<cr>]],  "Open new tab" },
    p = { [[<cmd>tabprev<cr>]], "Prev tab" },
    t = "Tableize",

    ["["] = { [[<cmd>tabnext<cr>]], "Next tab" },
    ["]"] = { [[<cmd>tabprev<cr>]], "Prev tab" },
  },
  x = {
    name = "+Trouble",
    d = { [[<cmd>TroubleToggle document_diagnostics<cr>]],  "toggle document diagnostics" },
    l = { [[<cmd>TroubleToggle loclist<cr>]],               "toggle location list" },
    q = { [[<cmd>TroubleToggle quickfix<cr>]],              "toggle quickfix" },
    w = { [[<cmd>TroubleToggle workspace_diagnostics<cr>]], "toggle workspace diagnostics" },
    x = { [[<cmd>TroubleToggle<cr>]],                       "toggle" },
    R = { [[<cmd>TroubleToggle lsp_references<cr>]],        "toggle lsp references" },
  },
  ["`"] = { [[<C-^>]], "Prev buffer" },
  ["<Enter>"] = "Org: Meta Return",
}

return leader
