local d = require('mappings.normal.leader.d')
local f = require('mappings.normal.leader.f')

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
    p = {
      name = "+LSP Pickers",
      c = {
        name = "+Code Actions",
        c = { [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]], "at Cursor" },
        r = { [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>]], "on Range" },
      },
      d = {
        name = "+Diagnostics",
        d = { [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>]], "Document" },
        w = { [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>]], "Workspace" },

        f = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "Definitions" },
        t = { [[<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>]], "Type Definitions" },
      },
      i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "Implementations" },
      r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "References" },
      s = {
        name = "+Symbols",
        d = { [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]], "Document" },
        w = { [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>]], "Workspace" },
        y = { [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>]], "Dyanmic workspace" },
      },
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
    p = { [[:cexpr system('pre-commit run --files ' . shellescape(expand('%')))<cr>:copen<cr>]], "Run pre-commit on current file" },
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
  g = {
    name = "+Git",
    c = { [[<cmd>Git commit<cr>]], "commit" },
    f = { [[<cmd>Git fetch<cr>]], "fetch" },
    g = { [[<cmd>Git<cr>]], "status" },
    l = { [[<cmd>Git pull<cr>]], "pull" },
    L = { [[<cmd>Git log<cr>]], "log" },
    p = { [[<cmd>Git push<cr>]], "push" },
    P = {
      name = "+Push",
      m = { [[<cmd>Git push -u origin main<cr>]], "main" },
      p = { [[:Git push -u origin<space>]], "branch" },
    },
    s = { [[<cmd>Git<cr>]], "status" },
    w = { [[<cmd>Gw<cr>]], "write" },
    S = { [[<cmd>Git stash<cr>]], "stash file" },
  },
  l = {
    name = "+Lists",
    c = { [[:changes<cr>]], "Show changes" },
    g = { [[:LazyGit<cr>]], "LazyGit" },
    j = { [[:jumps<cr>]], "Show jumps" },
    l = { [[:ls<cr>:b]], "Select buffer" },
    m = { [[:marks<cr>:normal! `]], "Show marks" },
  },
  m = {
    name = "+Local leader",
    e = { [[:e<cr>]], "Edit file" },
    f = {
      name = "+Telescope",
      a = { [[<cmd>lua require('plugins.telescope').search_all_files()<cr>]], "All files" },
      b = { [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]], "File browser" },
      f = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], "Fuzzy find" },
      g = { [[<cmd>lua require('telescope.builtin').git_status()<cr>]], "Git" },
      l = { [[<cmd>lua require('telescope').extensions.lazygit.lazygit()<cr>]], "Lazygit" },
      p = { [[<cmd>lua require('telescope.builtin').resume()<cr>]], "Resume" },
      P = { [[<cmd>lua require('telescope.builtin').pickers()<cr>]], "Previous pickers" },
      t = { [[<cmd>lua require('telescope.builtin').tags()<cr>]], "Tags" },

      d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "Definitions" },
      i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "Implementations" },
      r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "References" },
    },
    g = { [[<cmd>lua require('plugins.telescope').grep_prompt()<cr>]], "Grep String" },
    l = {
      name = "+LaTeX",
      C = "Clean full",
      G = "Status all",
      I = "Full Info",
      K = "Stop all",
      L = "Compile selected",
      T = "Toggle TOC",
      X = "Reload state",

      a = "Context menu",
      c = "Clean",
      e = "Errors",
      g = "Status",
      i = "Info",
      k = "Stop",
      l = "Compile",
      m = "imaps list",
      o = "Compile output",
      q = "Log",
      r = "Reverse search",
      s = "Toggle main",
      t = "Open TOC",
      v = "View",
      x = "Reload",
    },
    p = { [[:25split | term pre-commit run --files %<cr>]], "Run pre-commit on the current file in a terminal split" },
    t = {
      name = "+TableMode",
      m = "Toggle table mode",
      t = "Tableize",
    },
    ["<CR>"] = { [[<cmd>nohlsearch<cr>]], "Turn off highlight" },
  },
  o = {
    name = "+Open",
    c = { [[<cmd>copen<cr>]], "Quickfix" },
    l = { [[<cmd>lopen<cr>]], "Location" },
    p = { [[<cmd>NvimTreeFocus<cr>]], "Project in NvimTree" },
  },
  p = { [[:cexpr system('pre-commit run -a')<cr>:copen<cr>]], "Pre-commit into Quickfix List" },
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
