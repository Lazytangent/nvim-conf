local telescope = require 'telescope.builtin'
local telescope_extensions = require('telescope').extensions
local dap = require('dap')
local gitsigns = require('gitsigns')
local dial_map = require 'dial.map'

local spec = {
  { "#",      "#``", desc = "#" },
  { "*",      "*``", desc = "*" },
  {
    "<C-a>",
    function()
      dial_map.manipulate("increment", "normal")
    end,
    desc = "Increment with dial"
  },
  { "<C-h>",  desc = "Signature help" }, -- Set via LSP on_attach
  {
    "<C-w>d",
    function()
      vim.cmd "vsplit"
      vim.lsp.buf.definition()
    end,
    desc = "Vertical split and Go to definition"
  },
  {
    "<C-x>",
    function()
      dial_map.manipulate("decrement", "normal")
    end,
    desc = "Decrement with dial"
  },

  { "<leader>,",  group = "Utilities" },
  { "<leader>,*", "*<C-O>:%s///gn<cr>",  desc = "Count matches" },

  { "<leader>,,", "<C-^>", desc = "Prev buffer" },
  { "<leader>`",  "<C-^>", desc = "Prev buffer" },

  { "<leader>,d",  group = "Diagnostics" },
  { "<leader>,dh", vim.diagnostic.hide,     desc = "Hide diagnostics in buffer" },
  { "<leader>,ds", vim.diagnostic.show,     desc = "Show diagnostics in buffer" },
  { "<leader>,f",  vim.lsp.buf.format,      desc = "Format" },

  { "<leader>/",  telescope.current_buffer_fuzzy_find,  desc = "Search current buffer" },

  { "<leader><Enter>", desc = "Org: Meta Return" }, -- Only in Orgmode

  { "<leader><leader>",   group = "LSP" },
  { "<leader><leader>c",  group = "Utilities" },

  { "<leader>d",   group = "Debugger" },
  { "<leader>dc",  dap.continue,                              desc = "Start or Continue" },
  { "<leader>dd",  group = "Utils" },
  { "<leader>ddc", dap.clear_breakpoints,                     desc = "Clear all breakpoints" },
  { "<leader>ddl", dap.list_breakpoints,                      desc = "Lists all breakpoints in quickfix" },
  { "<leader>df",  group = "Telescope" },
  { "<leader>dg",  dap.run_to_cursor,                         desc = "Run to cursor" },
  { "<leader>di",  dap.step_into,                             desc = "Step Into" },
  { "<leader>dj",  dap.up,                                    desc = "Up stacktrace" },
  { "<leader>dk",  dap.down,                                  desc = "Down stacktrace" },
  { "<leader>dl",  require('dap.ext.vscode').load_launchjs,   desc = "Load .vscode/launch.json configs" },
  { "<leader>dn",  dap.step_over,                             desc = "Step Over" },
  { "<leader>do",  dap.step_out,                              desc = "Step Out" },
  { "<leader>dr",  require('dap.repl').open,                  desc = "Open REPL" },
  { "<leader>dt",  dap.toggle_breakpoint,                     desc = "Toggle breakpoint" },

  { "<leader>e", desc = "Show line diagnostics" },

  { "<leader>f",  group = "Telescope stuff" },
  { "<leader>f'", telescope.resume,                                        desc = "Resume" },
  { "<leader>f;", telescope.command_history,                               desc = "Command history" },
  { "<leader>f?", telescope.search_history,                                desc = "Search history" },
  { "<leader>fB", require('extensions.telescope.custom.java').build_files, desc = "Java Build Files" },
  { "<leader>fD", telescope.lsp_definitions,                               desc = "LSP Definitions" },
  { "<leader>fG", telescope.git_status,                                    desc = "Git" },
  { "<leader>fI", telescope.lsp_implementations,                           desc = "LSP Implementations" },
  { "<leader>fJ", require('extensions.telescope.custom.java').files,       desc = "Java Files" },
  { "<leader>fL", telescope_extensions.luasnip.luasnip,                    desc = "Luasnip" },
  { "<leader>fO", telescope.oldfiles,                                      desc = "Old files (recent)" },
  { "<leader>fP", require('utils.core').search_nvim,                       desc = "Private config" },
  { "<leader>fR", telescope.registers,                                     desc = "Registers" },
  { "<leader>fS", telescope.lsp_document_symbols,                          desc = "Symbols" },
  { "<leader>fT", telescope.treesitter,                                    desc = "Treesitter" },
  { "<leader>fb", telescope.buffers,                                       desc = "Buffers" },
  { "<leader>fc", telescope.commands,                                      desc = "Commands" },
  { "<leader>fd", function() telescope.diagnostics({ bufnr = 0 }) end,     desc = "Local diagnostics" },
  { "<leader>fe", telescope.resume,                                        desc = "Resume" },
  { "<leader>ff", telescope.find_files,                                    desc = "Files" },
  { "<leader>fg", telescope_extensions.live_grep_args.live_grep_args,      desc = "Live grep" },
  { "<leader>fh", telescope.help_tags,                                     desc = "Help tags" },
  { "<leader>fi", telescope.lsp_implementations,                           desc = "LSP Implementations" },
  { "<leader>fj", telescope.jumplist,                                      desc = "Jumplist" },
  { "<leader>fk", telescope.keymaps,                                       desc = "Keymaps" },
  { "<leader>fm", telescope.marks,                                         desc = "Marks" },
  { "<leader>fn", telescope.diagnostics,                                   desc = "Global diagnostics" },
  { "<leader>fo", telescope.quickfixhistory,                               desc = "Quickfix History" },
  { "<leader>fp", telescope.pickers,                                       desc = "Pickers" },
  { "<leader>fq", telescope.quickfix,                                      desc = "Quickfix" },
  { "<leader>fr", telescope.lsp_references,                                desc = "LSP References" },
  { "<leader>ft", telescope.grep_string,                                   desc = "This word" },
  { "<leader>fz", telescope.tags,                                          desc = "Tags" },

  { "<leader>fl",  group = "LSP Stuff" },
  { "<leader>fld", telescope.diagnostics,          desc = "Diagnostics" },
  { "<leader>fls", telescope.lsp_document_symbols, desc = "LSP Document Symbols" },

  { "<leader>fs",  "<cmd>w<cr>", desc = "Save file" },

  { "<leader>g",  group = "Git" },
  { "<leader>gg", "<cmd>Git<cr>",    desc = "status" },
  { "<leader>gs", "<cmd>Neogit<cr>", desc = "status" },

  { "<leader>gt",  group = "Gitsigns" },
  { "<leader>gtb", gitsigns.toggle_current_line_blame, desc = "Toggle blame" },
  { "<leader>gtd", gitsigns.toggle_deleted,            desc = "Toggle deleted" },
  { "<leader>gtn", gitsigns.toggle_numhl,              desc = "Toggle number hl" },
  { "<leader>gtp", gitsigns.preview_hunk,              desc = "Preview Hunk" },
  { "<leader>gts", gitsigns.toggle_signs,              desc = "Toggle signs" },
  { "<leader>gtw", gitsigns.toggle_word_diff,          desc = "Toggle word diff" },

  { "<leader>h",  group = "Help" },
  { "<leader>hh", telescope.help_tags, desc = "Help Tags" },
  { "<leader>hk", telescope.keymaps,   desc = "Keymaps" },

  { "<leader>l",  group = "LSP" },
  { "<leader>la", desc = "Code action" },                  -- via LSP on_attach
  { "<leader>lc", telescope.lsp_code_actions,              desc = "at Cursor" },
  { "<leader>lr", telescope.lsp_range_code_actions,        desc = "on Range" },
  { "<leader>ls", telescope.lsp_document_symbols,          desc = "Document" },
  { "<leader>lS", telescope.lsp_workspace_symbols,         desc = "Workspace" },
  { "<leader>lw", telescope.lsp_dynamic_workspace_symbols, desc = "Dynamic workspace" },
  { "<leader>lt", telescope.lsp_type_definitions,          desc = "Type Definitions" },

  { "<leader>m",     group = "Local leader" },
  { "<leader>m'",    require('femaco.edit').edit_code_block, desc = "Edit code block with FeMaco" },
  { "<leader>m<CR>", function() vim.cmd "nohlsearch" end,    desc = "Turn off highlight" },

  { "<leader>mgt",  group = "Toggle" },
  { "<leader>mgtd", desc = "Toggle deleted" },

  { "<leader>ml",  group = "LaTeX" },
  { "<leader>mlC", desc = "Clean full" },
  { "<leader>mlG", desc = "Status all" },
  { "<leader>mlI", desc = "Full Info" },
  { "<leader>mlK", desc = "Stop all" },
  { "<leader>mlL", desc = "Compile selected" },
  { "<leader>mlT", desc = "Toggle TOC" },
  { "<leader>mlX", desc = "Reload state" },
  { "<leader>mla", desc = "Context menu" },
  { "<leader>mlc", desc = "Clean" },
  { "<leader>mle", desc = "Errors" },
  { "<leader>mlg", desc = "Status" },
  { "<leader>mli", desc = "Info" },
  { "<leader>mlk", desc = "Stop" },
  { "<leader>mll", desc = "Compile" },
  { "<leader>mlm", desc = "imaps list" },
  { "<leader>mlo", desc = "Compile output" },
  { "<leader>mlq", desc = "Log" },
  { "<leader>mlr", desc = "Reverse search" },
  { "<leader>mls", desc = "Toggle main" },
  { "<leader>mlt", desc = "Open TOC" },
  { "<leader>mlv", desc = "View" },
  { "<leader>mlx", desc = "Reload" },

  { "<leader>mo", require("oil").open_float },

  { "<leader>mp",  group = "LSP Pickers" },
  { "<leader>mpc", desc = "LSP Code Actions" },
  { "<leader>mpe", desc = "LSP References" },
  { "<leader>mpi", desc = "LSP Implementations" },
  { "<leader>mpr", desc = "LSP Rename" },
  { "<leader>mpt", desc = "LSP Type Definition" },

  { "<leader>mpw",  group = "Workspace Folders" },
  { "<leader>mpwa", desc = "Add workspace folder" },
  { "<leader>mpwl", desc = "List workspace folders" },
  { "<leader>mpwr", desc = "Remove workspace folder" },
  { "<leader>mr",   desc = "Rename" },

  { "<leader>mt",  group = "TableMode" },
  { "<leader>mtm", desc = "Toggle table mode" },
  { "<leader>mtt", desc = "Tableize" },

  { "<leader>o$", desc = "Org: Archive subtree" },
  { "<leader>o'", desc = "Org: Edit special" },
  { "<leader>o,", desc = "Org: Change priority" },
  { "<leader>oA", desc = "Org: Archive current headline" },
  { "<leader>oJ", desc = "Org: Move subtree down" },
  { "<leader>oK", desc = "Org: Move subtree up" },
  { "<leader>oe", desc = "Org: Export" },

  { "<leader>oi",  group = "Insert" },
  { "<leader>oi!", desc = "Timestamp Inactive" },
  { "<leader>oi.", desc = "Timestamp" },
  { "<leader>oiT", desc = "TODO Heading" },
  { "<leader>oid", desc = "Deadline" },
  { "<leader>oih", desc = "Heading" },
  { "<leader>ois", desc = "Schedule" },
  { "<leader>ok",  desc = "Org SRC: Abort changes" },
  { "<leader>oo",  desc = "Org: Open at point" },
  { "<leader>or",  desc = "Org: Refile" },
  { "<leader>ot",  desc = "Org: Set tags on current headline" },
  { "<leader>ow",  desc = "Org SRC: Write changes" },
  { "<leader>ox",  group = "Clock" },
  { "<leader>oxe", desc = "Org: Set Effort" },
  { "<leader>oxi", desc = "Org: Clock in" },
  { "<leader>oxj", desc = "Org: Clock GoTo" },
  { "<leader>oxo", desc = "Org: Clock out" },
  { "<leader>oxq", desc = "Org: Cancel Clock" },

  { "<leader>pd",  group = "Diagnostics" },
  { "<leader>pdd", telescope.lsp_document_diagnostics,  desc = "Document" },
  { "<leader>pdw", telescope.lsp_workspace_diagnostics, desc = "Workspace" },

  { "<leader>q", desc = "Set diagnostics into location list" }, -- Set via LSP on_attach

  { "<leader>t",  group = "Tabs and Table Mode" },
  { "<leader>tm", desc = "Table Mode Toggle" },
  { "<leader>tt", desc = "Tableize" },

  { "<leader>x",  group = "Trouble" },
  { "<leader>xR", function() vim.cmd "Trouble lsp_references" end, desc = "toggle lsp references" },
  { "<leader>xl", function() vim.cmd "Trouble loclist" end,        desc = "toggle location list" },
  { "<leader>xq", function() vim.cmd "Trouble quickfix" end,       desc = "toggle quickfix" },
  { "<leader>xx", function() vim.cmd "Trouble diagnostics" end,    desc = "toggle" },

  { "K", desc = "Hover" }, -- LSP on_attach

  { "[<C-L>",   desc = "Last error of prev file in loclist" },
  { "[<C-Q>",   desc = "Last error of prev file in quickfix" },
  { "[<C-T>",   desc = "Prev tag in previous window" },
  { "[<Space>", desc = "Add line above" },
  { "[A",       desc = "First arg" },
  { "[B",       desc = "Prev block end" },
  { "[C",       desc = "Prev conditional end" },
  { "[L",       desc = "Prev loop end" },
  { "[Q",       desc = "First quickfix list item" },
  { "[T",       desc = "First tag" },
  { "[[",       desc = "Prev class start" },
  { "[]",       desc = "Prev class end" },
  { "[a",       desc = "Prev arg" },
  { "[b",       desc = "Prev block start" },
  { "[c",       desc = "Prev conditional start" },
  { "[d",       desc = "Go to prev diagnostic" },
  { "[e",       desc = "Go to prev error level diagnostic" },
  { "[f",       desc = "Previous file (alphabetically)" },
  { "[h",       desc = "Prev hunk" },
  { "[l",       desc = "Prev loop start" },
  { "[n",       desc = "Previous SCM conflict marker" },
  { "[o",       group = "options" },
  { "[ob",      desc = "set background light" },
  { "[oc",      desc = "set cursorline on" },
  { "[od",      desc = "set diff on" },
  { "[oh",      desc = "set hlsearch on" },
  { "[oi",      desc = "set ignorecase on" },
  { "[ol",      desc = "set list on" },
  { "[on",      desc = "set number on" },
  { "[or",      desc = "set relativenumber on" },
  { "[os",      desc = "set spell on" },
  { "[ou",      desc = "set cursorcolumn on" },
  { "[ov",      desc = "set virtualedit on" },
  { "[ow",      desc = "set wrap on" },
  { "[ox",      desc = "set crosshairs on" },
  { "[q",       desc = "Prev quickfix list item" },
  { "[t",       desc = "Prev tag" },

  { "]<C-L>",   desc = "First error of next file in loclist" },
  { "]<C-Q>",   desc = "First error of next file in quickfix" },
  { "]<C-T>",   desc = "Next tag in previous window" },
  { "]<Space>", desc = "Add line below" },
  { "]A",       desc = "First arg" },
  { "]B",       desc = "Next block end" },
  { "]C",       desc = "Prev conditional end" },
  { "]E",       desc = "Next call start" },
  { "]L",       desc = "Last location list item" },
  { "]Q",       desc = "Last quickfix list item" },
  { "]T",       desc = "Last tag" },
  { "][",       desc = "Next class start" },
  { "]]",       desc = "Next class end" },
  { "]a",       desc = "Next arg" },
  { "]b",       desc = "Next block start" },
  { "]c",       desc = "Next conditional start" },
  { "]d",       desc = "Go to next diagnostic" },
  { "]e",       desc = "Go to next error level diagnostic" },
  { "]f",       desc = "Next file (alphabetically)" },
  { "]h",       desc = "Next hunk" },
  { "]l",       desc = "Next location list item" },
  { "]n",       desc = "Next SCM conflict marker" },
  { "]o",       group = "options" },
  { "]ob",      desc = "set background dark" },
  { "]oc",      desc = "set cursorline off" },
  { "]od",      desc = "set diff off" },
  { "]oh",      desc = "set hlsearch off" },
  { "]oi",      desc = "set ignorecase off" },
  { "]ol",      desc = "set list off" },
  { "]on",      desc = "set number off" },
  { "]or",      desc = "set relativenumber off" },
  { "]os",      desc = "set spell off" },
  { "]ou",      desc = "set cursorcolumn off" },
  { "]ov",      desc = "set virtualedit off" },
  { "]ow",      desc = "set wrap off" },
  { "]ox",      desc = "set crosshairs off" },
  { "]q",       desc = "Next quickfix list item" },
  { "]t",       desc = "Next tag" },

  { "ci",  group = "Inner" },
  { "ciR", desc = "Org: Decrease priority of headline" },
  { "ciT", desc = "Org: Cycle TODO backwards" },
  { "cid", desc = "Org: Change inner date" },
  { "cir", desc = "Org: Increase priority of headline" },
  { "cit", desc = "Org: Cycle TODO forwards" },

  { "ga", "<Plug>(EasyAlign)", desc = "Easy Align" },
  {
    "g<C-a>",
    function()
      dial_map.manipulate("increment", "gnormal")
    end,
    desc = "gnormal increment",
  },
  {
    "g<C-x>",
    function()
      dial_map.manipulate("decrement", "gnormal")
    end,
    desc = "gnormal decrement",
  },

  { "j", "v:count == 0 ? 'gj' : 'j'", desc = "Up (virtual) line",   expr = true },
  { "k", "v:count == 0 ? 'gk' : 'k'", desc = "Down (virtual) line", expr = true },

  { "yo",  group = "option" },
  { "yob", desc = "background" },
  { "yoc", desc = "cursorline" },
  { "yod", desc = "diff" },
  { "yoh", desc = "hlsearch" },
  { "yoi", desc = "ignorecase" },
  { "yol", desc = "list" },
  { "yon", desc = "number" },
  { "yor", desc = "relativenumber" },
  { "yos", desc = "spell" },
  { "you", desc = "cursorcolumn" },
  { "yov", desc = "virtualedit" },
  { "yow", desc = "wrap" },
  { "yox", desc = "crosshairs" },

  { "yom", "<cmd>set modifiable<cr>", desc = "Set modifiable" },
  {
    "yoz",
    function()
      if vim.g.syntax_on == 1 then
        vim.cmd "syntax off"
      else
        vim.cmd "syntax enable"
      end
    end,
    desc = "Toggle syntax"
  },
}

return spec
