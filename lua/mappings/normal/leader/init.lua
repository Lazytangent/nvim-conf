local f = require('mappings.normal.leader.f')
local g = require('mappings.normal.leader.g')
local o = require('mappings.normal.leader.o')
local localleader = require('mappings.normal.leader.localleader')
local utils = require('mappings.utils')

local telescope_builtin = [[<cmd>lua require('telescope.builtin').]]

local leader = {
  ["<leader>"] = {
    name = "+LSP",
    c = {
      name = "+Utilities",
      l = { utils.telescope_extensions "luasnip.luasnip()", "Telescope: LuaSnip" },
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
    },
    x = { utils.cmd "luafile %", "Run luafile" },
  },
  [","] = {
    name = "+Utilities",
    d = {
      name = "+Diagnostics",
      h = { utils.cmd "lua vim.diagnostic.hide()", "Hide diagnostics in buffer" },
      s = { utils.cmd "lua vim.diagnostic.show()", "Show diagnostics in buffer" },
    },
    f = { utils.cmd "vim.lsp.buf.format({ async = true })",   "Format" },
    g = { [[:set operatorfunc=GrepOperator<cr>g@]],           "Grep for word under cursor" },
    p = { "<cmd>lua require('yabs'):run_task('pre_commit')<cr>:e<cr>", "Run pre-commit on current file" },
    t = {
      name = "+Terminal",
      b = { [[:15split | term<cr>]], "Bottom terminal" },
      n = { [[:Term<cr>]],           "25 height bottom" },
    },
    [","] = { [[<c-^>]], "Last buffer" },
    ["*"] = { [[*<C-O>:%s///gn<cr>]], "Count matches" },
  },
  a = {
    name = "+Add/Arglist",
    a = { utils.cmd "args", "Print arglist" },
    n = { utils.cmd "next", "Next file in arglist" },
    O = { [[O<Esc>]],       "Add new line above" },
    o = { [[o<Esc>]],       "Add new line below" },
    p = { utils.cmd "prev", "Prev file in arglist" },
  },
  b = {
    name = "+Buffers",
    d = { utils.cmd "%bdelete",                "Close buffers" },
    l = { utils.telescope_builtin "buffers()", "List buffers" },
    n = { utils.cmd "bnext",                   "Next buffer" },
    p = { utils.cmd "bprevious",               "Prev buffer" },
    w = { utils.cmd "bwipeout",                "Wipeout buffer", },
  },
  c = {
    name = "+Change",
    c = { utils.telescope_builtin "colorscheme()", "colorscheme" },
    d = { utils.cmd "cd %:p:h",                    "Change working directory" },
  },
  e = "Show line diagnostics",
  f = f,
  g = g,
  h = {
    name = "+Help",
    h = { utils.telescope_builtin "help_tags()", "Help Tags" },
  },
  l = {
    name = "+LagyGit",
    g = { utils.cmd "LazyGit", "LazyGit" },
  },
  m = localleader,
  o = o,
  n = {
    name = "Neotest",
    a = { utils.lua_require("neotest", "run.attach()"),                  "Attach to nearest test" },
    d = { utils.lua_require("neotest", "run.run({ strategy = 'dap' })"), "Debug nearest test" },
    f = { utils.lua_require("neotest", "run.run(vim.fn.expand('%'))"),   "Nearest test" },
    n = { utils.lua_require('neotest', "jump.next({ status = 'failed' })"), "Next failed" },
    o = { utils.lua_require("neotest", "output.open({ enter = true })"), "Open output" },
    p = { utils.lua_require('neotest', "jump.prev({ status = 'failed' })"), "Prev failed" },
    s = { utils.lua_require("neotest", "run.stop()"),                    "Stop test" },
    t = { utils.lua_require("neotest", "run.run()"),                     "Nearest test" },

    m = {
      name = "Summary",
      c = { utils.lua_require("neotest", "summary.close()"),  "Close summary" },
      o = { utils.lua_require("neotest", "summary.open()"),   "Open summary" },
      m = { utils.lua_require("neotest", "summary.toggle()"), "Toggle summary" },
      t = { utils.lua_require("neotest", "summary.toggle()"), "Toggle summary" },
    },
  },
  p = {
    name = "+LSP Pickers",
    c = {
      name = "+Code Actions",
      c = { utils.telescope_builtin "lsp_code_actions()",       "at Cursor" },
      r = { utils.telescope_builtin "lsp_range_code_actions()", "on Range" },
    },
    d = { utils.telescope_builtin "lsp_definitions()",     "Definitions" },
    i = { utils.telescope_builtin "lsp_implementations()", "Implementations" },
    r = { utils.telescope_builtin "lsp_references()",      "References" },
    s = {
      name = "+Symbols",
      d = { utils.telescope_builtin "lsp_document_symbols()",          "Document" },
      w = { utils.telescope_builtin "lsp_workspace_symbols()",         "Workspace" },
      y = { utils.telescope_builtin "lsp_dynamic_workspace_symbols()", "Dynamic workspace" },
    },
    t = { utils.telescope_builtin "lsp_type_definitions()", "Type Definitions" },

    D = {
      name = "+Diagnostics",
      d = { utils.telescope_builtin "lsp_document_diagnostics()",  "Document" },
      w = { utils.telescope_builtin "lsp_workspace_diagnostics()", "Workspace" },
    },

    p = { utils.telescope_extensions "project.project()", "Telescope: Project" },
  },
  q = "Set diagnostics into location list",
  r = {
    name = "Refactoring",
    b = { utils.lua_require("refactoring", "refactor('Extract Block')"), "Extract block" },
    f = { utils.lua_require("refactoring", "refactor('Extract Block To File')"), "Extract block to file" },
    i = { utils.lua_require("refactoring", "refactor('Inline Variable')"), "Inline variable" },

    c = { utils.lua_require("refactoring", "debug.cleanup({})"), "Clean up" },
    p = { utils.lua_require("refactoring", "debug.printf({ below = true })"), "printf" },
    v = { utils.lua_require("refactoring", "debug.print_var({ normal = true })"), "print_var" },
  },
  s = {
    name = "+Spell",
    s = { utils.cmd "setlocal spell!", "Toggle spellcheck" },
  },
  t = {
    name = "+Tabs and Table Mode",
    c = { utils.cmd "tabclose",  "Close tab" },
    e = { utils.cmd "tabedit",   "Open a new tab" },
    h = { utils.cmd "tabmove -", "Move tab left" },
    l = { utils.cmd "tabmove +", "Move tab right" },
    m = "Table Mode Toggle",
    n = { utils.cmd "tabnext", "Next tab" },
    o = { utils.cmd "tabnew",  "Open new tab" },
    p = { utils.cmd "tabprev", "Prev tab" },
    t = "Tableize",

    ["["] = { utils.cmd "tabprev", "Next tab" },
    ["]"] = { utils.cmd "tabnext", "Prev tab" },
  },
  x = {
    name = "+Trouble",
    d = { utils.cmd "TroubleToggle document_diagnostics",  "toggle document diagnostics" },
    l = { utils.cmd "TroubleToggle loclist",               "toggle location list" },
    q = { utils.cmd "TroubleToggle quickfix",              "toggle quickfix" },
    w = { utils.cmd "TroubleToggle workspace_diagnostics", "toggle workspace diagnostics" },
    x = { utils.cmd "TroubleToggle",                       "toggle" },
    R = { utils.cmd "TroubleToggle lsp_references",        "toggle lsp references" },
  },
  ["`"] = { [[<C-^>]], "Prev buffer" },
  ["<Enter>"] = "Org: Meta Return",
}

return leader
