local spec = {
  { "#", "#``", desc = "#" },
  { "*", "*``", desc = "*" },
  { "<C-B>", desc = "Back up a page" },
  { "<C-D>", desc = "Down half a page" },
  { "<C-F>", desc = "Forward down a page" },
  { "<C-U>", desc = "Up half a page" },
  { "<C-a>", '<Cmd>lua require"dial.command".select_augend_normal()<CR><Cmd>let &opfunc="dial#operator#increment_normal"<CR>g@<Cmd>lua require("dial.command").textobj()<CR>', desc = "Increment with dial" },
  { "<C-h>", desc = "Signature help" },
  { "<C-j>", ":<C-U>exec \"exec 'norm m`' | move +\" . (0+v:count1)<cr>", desc = "Move line down" },
  { "<C-k>", ":<C-U>exec \"exec 'norm m`' | move -\" . (1+v:count1)<cr>", desc = "Move line up" },
  { "<C-w>", group = "Window commands" },
  { "<C-w>d", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<cr>", desc = "Vertical split and Go to definition" },
  { "<C-x>", '<Cmd>lua require"dial.command".select_augend_normal()<CR><Cmd>let &opfunc="dial#operator#decrement_normal"<CR>g@<Cmd>lua require("dial.command").textobj()<CR>', desc = "Decrement with dial" },
  { "<leader>,", group = "Utilities" },
  { "<leader>,*", "*<C-O>:%s///gn<cr>", desc = "Count matches" },
  { "<leader>,,", "<c-^>", desc = "Last buffer" },
  { "<leader>,d", group = "Diagnostics" },
  { "<leader>,dh", "<cmd>lua vim.diagnostic.hide()<cr>", desc = "Hide diagnostics in buffer" },
  { "<leader>,ds", "<cmd>lua vim.diagnostic.show()<cr>", desc = "Show diagnostics in buffer" },
  { "<leader>,f", desc = "Format" },
  { "<leader>,g", ":set operatorfunc=GrepOperator<cr>g@", desc = "Grep for word under cursor" },
  { "<leader>,t", group = "Terminal" },
  { "<leader>,tb", ":15split | term<cr>", desc = "Bottom terminal" },
  { "<leader>,tn", ":Term<cr>", desc = "25 height bottom" },
  { "<leader>/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Search current buffer" },
  { "<leader><Enter>", desc = "Org: Meta Return" },
  { "<leader><leader>", group = "LSP" },
  { "<leader><leader>c", group = "Utilities" },
  { "<leader><leader>cl", "<cmd>lua require('telescope').extensions.luasnip.luasnip()<cr>", desc = "Telescope: LuaSnip" },
  { "<leader><leader>d", group = "Textobjects peek" },
  { "<leader><leader>dc", desc = "Outer class" },
  { "<leader><leader>df", desc = "Outer function" },
  { "<leader><leader>l", group = "LSP" },
  { "<leader><leader>lD", desc = "Declaration" },
  { "<leader><leader>lc", desc = "Code action" },
  { "<leader><leader>ld", desc = "Definition" },
  { "<leader><leader>lr", desc = "References" },
  { "<leader><leader>lt", desc = "Type definition" },
  { "<leader><leader>w", group = "LSP Workspace" },
  { "<leader><leader>wa", desc = "Add workspace folder" },
  { "<leader><leader>wl", desc = "List workspace folders" },
  { "<leader><leader>wr", desc = "Remove workspace folder" },
  { "<leader><leader>x", "<cmd>luafile %<cr>", desc = "Run luafile" },
  { "<leader>`", "<C-^>", desc = "Prev buffer" },
  { "<leader>a", group = "Add/Arglist" },
  { "<leader>aO", "O<Esc>", desc = "Add new line above" },
  { "<leader>aa", "<cmd>args<cr>", desc = "Print arglist" },
  { "<leader>an", "<cmd>next<cr>", desc = "Next file in arglist" },
  { "<leader>ao", "o<Esc>", desc = "Add new line below" },
  { "<leader>ap", "<cmd>prev<cr>", desc = "Prev file in arglist" },
  { "<leader>b", group = "Buffers" },
  { "<leader>bd", "<cmd>%bdelete<cr>", desc = "Close buffers" },
  { "<leader>bl", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "List buffers" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Prev buffer" },
  { "<leader>bw", "<cmd>bwipeout<cr>", desc = "Wipeout buffer" },
  { "<leader>c", group = "Change" },
  { "<leader>cc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", desc = "colorscheme" },
  { "<leader>cd", "<cmd>cd %:p:h<cr>", desc = "Change working directory" },
  { "<leader>d", group = "Debugger" },
  { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Start or Continue" },
  { "<leader>dd", group = "Utils" },
  { "<leader>ddc", "<cmd>lua require('dap').clear_breakpoints()<cr>", desc = "Clear all breakpoints" },
  { "<leader>ddl", "<cmd>lua require('dap').list_breakpoints()<cr>", desc = "Lists all breakpoints in quickfix" },
  { "<leader>df", group = "Telescope" },
  { "<leader>dfc", "<cmd>lua require('telescope').extensions.dap.commands()<cr>", desc = "Commands" },
  { "<leader>dff", "<cmd>lua require('telescope').extensions.dap.frames()<cr>", desc = "Frames" },
  { "<leader>dfl", "<cmd>lua require('telescope').extensions.dap.list_breakpoints()<cr>", desc = "List Breakpoints" },
  { "<leader>dfo", "<cmd>lua require('telescope').extensions.dap.configurations()<cr>", desc = "Configurations" },
  { "<leader>dfv", "<cmd>lua require('telescope').extensions.dap.variables()<cr>", desc = "Variables" },
  { "<leader>dg", "<cmd>lua require('dap').run_to_cursor()<cr>", desc = "Run to cursor" },
  { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step Into" },
  { "<leader>dj", "<cmd>lua require('dap').up()<cr>", desc = "Up stacktrace" },
  { "<leader>dk", "<cmd>lua require('dap').down()<cr>", desc = "Down stacktrace" },
  { "<leader>dl", "<cmd>lua require('dap.ext.vscode').load_launchjs()<cr>", desc = "Load .vscode/launch.json configs" },
  { "<leader>dn", "<cmd>lua require('dap').step_over()<cr>", desc = "Step Over" },
  { "<leader>do", "<cmd>lua require('dap').step_out()<cr>", desc = "Step Out" },
  { "<leader>dp", "<cmd>lua require('extensions.dap').configure_python_debugger()<cr>", desc = "Attach Python Debugger" },
  { "<leader>dr", "<cmd>lua require('dap.repl').open()<cr>", desc = "Open REPL" },
  { "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
  { "<leader>du", group = "UI" },
  { "<leader>duc", "<cmd>lua require('dapui').close()<cr>", desc = "Close" },
  { "<leader>duo", "<cmd>lua require('dapui').open()<cr>", desc = "Open" },
  { "<leader>dut", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle" },
  { "<leader>duu", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle" },
  { "<leader>e", desc = "Show line diagnostics" },
  { "<leader>f", group = "Telescope stuff" },
  { "<leader>f/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Search current buffer" },
  { "<leader>f;", "<cmd>lua require('telescope.builtin').command_history()<cr>", desc = "Command history" },
  { "<leader>f?", "<cmd>lua require('telescope.builtin').search_history()<cr>", desc = "Search history" },
  { "<leader>fB", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", desc = "File browser" },
  { "<leader>fD", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "LSP Definitions" },
  { "<leader>fG", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = "Git" },
  { "<leader>fL", "<cmd>lua require('telescope').extensions.luasnip.luasnip()<cr><cr>", desc = "Luasnip" },
  { "<leader>fO", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Old files (recent)" },
  { "<leader>fP", "<cmd>lua require('utils.core').search_nvim()<cr>", desc = "Private config" },
  { "<leader>fR", "<cmd>lua require('telescope.builtin').registers()<cr>", desc = "Registers" },
  { "<leader>fS", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", desc = "Symbols" },
  { "<leader>fT", "<cmd>lua require('telescope.builtin').treesitter()<cr>", desc = "Treesitter" },
  { "<leader>fa", "<cmd>lua require('extensions.telescope').search_all_files()<cr>", desc = "All files" },
  { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Buffers" },
  { "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "Commands" },
  { "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics({ bufnr = 0 })<cr>", desc = "Local diagnostics" },
  { "<leader>fe", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "Resume" },
  { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Files" },
  { "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Live grep" },
  { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help tags" },
  { "<leader>fi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", desc = "LSP Implementations" },
  { "<leader>fj", "<cmd>lua require('telescope.builtin').jumplist()<cr>", desc = "Jumplist" },
  { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "Keymaps" },
  { "<leader>fl", group = "LSP Stuff" },
  { "<leader>fld", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = "Diagnostics" },
  { "<leader>fls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", desc = "LSP Document Symbols" },
  { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", desc = "Marks" },
  { "<leader>fn", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = "Global diagnostics" },
  { "<leader>fo", "<cmd>lua require('telescope.builtin').quickfixhistory()<cr>", desc = "Quickfix History" },
  { "<leader>fp", "<cmd>lua require('telescope.builtin').pickers()<cr>", desc = "Pickers" },
  { "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", desc = "Quickfix" },
  { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "LSP References" },
  { "<leader>fs", "<cmd>w<cr>", desc = "Save file" },
  { "<leader>ft", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "This word" },
  { "<leader>fw", "<cmd>lua require('telescope').extensions.workspaces.workspaces()<cr>", desc = "Workspaces" },
  { "<leader>g", group = "Git" },
  { "<leader>gL", "<cmd>Git log<cr>", desc = "log" },
  { "<leader>gP", group = "Push" },
  { "<leader>gPm", "<cmd>Git push -u origin main<cr>", desc = "main" },
  { "<leader>gPp", ":Git push -u origin<space>", desc = "branch" },
  { "<leader>gS", "<cmd>Git stash<cr>", desc = "stash file" },
  { "<leader>gc", "<cmd>Git commit<cr>", desc = "commit" },
  { "<leader>gf", "<cmd>Git fetch<cr>", desc = "fetch" },
  { "<leader>gg", "<cmd>Git<cr>", desc = "status" },
  { "<leader>gl", "<cmd>Git pull<cr>", desc = "pull" },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "push" },
  { "<leader>gs", "<cmd>Git<cr>", desc = "status" },
  { "<leader>gt", group = "Toggle" },
  { "<leader>gtb", "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", desc = "Toggle blame" },
  { "<leader>gtd", "<cmd>lua require('gitsigns').toggle_deleted()<cr>", desc = "Toggle deleted" },
  { "<leader>gtn", "<cmd>lua require('gitsigns').toggle_numhl()<cr>", desc = "Toggle number hl" },
  { "<leader>gts", "<cmd>lua require('gitsigns').toggle_signs()<cr>", desc = "Toggle signs" },
  { "<leader>gtw", "<cmd>lua require('gitsigns').toggle_word_diff()<cr>", desc = "Toggle word diff" },
  { "<leader>gw", "<cmd>Gw<cr>", desc = "write" },
  { "<leader>h", group = "Help" },
  { "<leader>hh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help Tags" },
  { "<leader>l", group = "LagyGit and LSP" },
  { "<leader>la", desc = "Code action" },
  { "<leader>m", group = "Local leader" },
  { "<leader>m'", "<cmd>lua require('femaco.edit').edit_code_block()<cr>", desc = "Edit code block with FeMaco" },
  { "<leader>m<CR>", "<cmd>nohlsearch<cr>", desc = "Turn off highlight" },
  { "<leader>mB", desc = "Swap with previous block" },
  { "<leader>mC", desc = "Swap with previous class" },
  { "<leader>mb", desc = "Swap with next block" },
  { "<leader>mc", desc = "Swap with next class" },
  { "<leader>md", group = "LSP Interop" },
  { "<leader>mdc", desc = "Outer class definition" },
  { "<leader>mdf", desc = "Outer function definition" },
  { "<leader>me", ":e<cr>", desc = "Edit file" },
  { "<leader>mf", group = "Telescope" },
  { "<leader>mfB", "<cmd>lua require('extensions.telescope.custom.java').build_files()<cr>", desc = "Java Build Files" },
  { "<leader>mfP", "<cmd>lua require('telescope.builtin').pickers()<cr>", desc = "Previous pickers" },
  { "<leader>mfa", "<cmd>lua require('extensions.telescope').search_all_files()<cr>", desc = "All files" },
  { "<leader>mfb", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", desc = "File browser" },
  { "<leader>mfd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "Definitions" },
  { "<leader>mff", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Fuzzy find" },
  { "<leader>mfg", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = "Git" },
  { "<leader>mfi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", desc = "Implementations" },
  { "<leader>mfj", "<cmd>lua require('extensions.telescope.custom.java').files()<cr>", desc = "Java Files" },
  { "<leader>mfp", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = "Resume" },
  { "<leader>mfr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "References" },
  { "<leader>mft", "<cmd>lua require('telescope.builtin').tags()<cr>", desc = "Tags" },
  { "<leader>mg", group = "Gitsigns" },
  { "<leader>mgD", desc = "Diff this ~" },
  { "<leader>mgd", desc = "Diff this" },
  { "<leader>mgp", desc = "Preview hunk" },
  { "<leader>mgt", group = "Toggle" },
  { "<leader>mgtd", desc = "Toggle deleted" },
  { "<leader>ml", group = "LaTeX" },
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
  { "<leader>mM", function() require("treesj").toggle({ split = { recursive = true } }) end },
  { "<leader>mo", require("oil").open_float },
  { "<leader>mp", group = "LSP Pickers" },
  { "<leader>mpc", desc = "LSP Code Actions" },
  { "<leader>mpe", desc = "LSP References" },
  { "<leader>mpi", desc = "LSP Implementations" },
  { "<leader>mpr", desc = "LSP Rename" },
  { "<leader>mpt", desc = "LSP Type Definition" },
  { "<leader>mpw", group = "Workspace Folders" },
  { "<leader>mpwa", desc = "Add workspace folder" },
  { "<leader>mpwl", desc = "List workspace folders" },
  { "<leader>mpwr", desc = "Remove workspace folder" },
  { "<leader>mr", desc = "Rename" },
  { "<leader>mt", group = "TableMode" },
  { "<leader>mtm", desc = "Toggle table mode" },
  { "<leader>mtt", desc = "Tableize" },
  { "<leader>o", group = "Open" },
  { "<leader>o$", desc = "Org: Archive subtree" },
  { "<leader>o'", desc = "Org: Edit special" },
  { "<leader>o,", desc = "Org: Change priority" },
  { "<leader>oA", desc = "Org: Archive current headline" },
  { "<leader>oJ", desc = "Org: Move subtree down" },
  { "<leader>oK", desc = "Org: Move subtree up" },
  { "<leader>oc", "<cmd>copen<cr>", desc = "Quickfix" },
  { "<leader>oe", desc = "Org: Export" },
  { "<leader>oi", group = "Insert" },
  { "<leader>oi!", desc = "Timestamp Inactive" },
  { "<leader>oi.", desc = "Timestamp" },
  { "<leader>oiT", desc = "TODO Heading" },
  { "<leader>oid", desc = "Deadline" },
  { "<leader>oih", desc = "Heading" },
  { "<leader>ois", desc = "Schedule" },
  { "<leader>ok", desc = "Org SRC: Abort changes" },
  { "<leader>ol", "<cmd>lopen<cr>", desc = "Location" },
  { "<leader>oo", desc = "Org: Open at point" },
  { "<leader>op", "<cmd>NvimTreeFocus<cr>", desc = "Project in NvimTree" },
  { "<leader>or", desc = "Org: Refile" },
  { "<leader>ot", desc = "Org: Set tags on current headline" },
  { "<leader>ow", desc = "Org SRC: Write changes" },
  { "<leader>ox", group = "Clock" },
  { "<leader>oxe", desc = "Org: Set Effort" },
  { "<leader>oxi", desc = "Org: Clock in" },
  { "<leader>oxj", desc = "Org: Clock GoTo" },
  { "<leader>oxo", desc = "Org: Clock out" },
  { "<leader>oxq", desc = "Org: Cancel Clock" },
  { "<leader>p", group = "LSP Pickers" },
  { "<leader>pD", group = "Diagnostics" },
  { "<leader>pDd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", desc = "Document" },
  { "<leader>pDw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", desc = "Workspace" },
  { "<leader>pc", group = "Code Actions" },
  { "<leader>pcc", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", desc = "at Cursor" },
  { "<leader>pcr", "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>", desc = "on Range" },
  { "<leader>pd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "Definitions" },
  { "<leader>pi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", desc = "Implementations" },
  { "<leader>pp", "<cmd>lua require('telescope').extensions.project.project()<cr>", desc = "Telescope: Project" },
  { "<leader>pr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "References" },
  { "<leader>ps", group = "Symbols" },
  { "<leader>psd", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", desc = "Document" },
  { "<leader>psw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", desc = "Workspace" },
  { "<leader>psy", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", desc = "Dynamic workspace" },
  { "<leader>pt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", desc = "Type Definitions" },
  { "<leader>q", desc = "Set diagnostics into location list" },
  { "<leader>rh", "<cmd>IronHide<cr>", desc = "Hide Iron REPL" },
  { "<leader>rr", "<cmd>IronRestart<cr>", desc = "Restart Iron REPL" },
  { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Open Iron REPL" },
  { "<leader>s", group = "Send to REPL" },
  { "<leader>s<CR>", desc = "CR" },
  { "<leader>sC", desc = "Clear Iron REPL" },
  { "<leader>sc", desc = "Send motion" },
  { "<leader>sf", desc = "Send file" },
  { "<leader>sl", desc = "Send line" },
  { "<leader>sq", desc = "Exit Iron REPL" },
  { "<leader>ss", "<cmd>SymbolsOutline<cr>", desc = "Toggle symbols outline" },
  { "<leader>t", group = "Tabs and Table Mode" },
  { "<leader>t[", "<cmd>tabprev<cr>", desc = "Next tab" },
  { "<leader>t]", "<cmd>tabnext<cr>", desc = "Prev tab" },
  { "<leader>tc", "<cmd>tabclose<cr>", desc = "Close tab" },
  { "<leader>te", "<cmd>tabedit<cr>", desc = "Open a new tab" },
  { "<leader>th", "<cmd>tabmove -<cr>", desc = "Move tab left" },
  { "<leader>tl", "<cmd>tabmove +<cr>", desc = "Move tab right" },
  { "<leader>tm", desc = "Table Mode Toggle" },
  { "<leader>tn", "<cmd>tabnext<cr>", desc = "Next tab" },
  { "<leader>to", "<cmd>tabnew<cr>", desc = "Open new tab" },
  { "<leader>tp", "<cmd>tabprev<cr>", desc = "Prev tab" },
  { "<leader>tt", desc = "Tableize" },
  { "<leader>x", group = "Trouble" },
  { "<leader>xR", "<cmd>Trouble lsp_references<cr>", desc = "toggle lsp references" },
  { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "toggle location list" },
  { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "toggle quickfix" },
  { "<leader>xx", "<cmd>Trouble diagnostics<cr>", desc = "toggle" },
  { "K", desc = "Hover" },
  { "[<C-L>", desc = "Last error of prev file in loclist" },
  { "[<C-Q>", desc = "Last error of prev file in quickfix" },
  { "[<C-T>", desc = "Prev tag in previous window" },
  { "[<Space>", desc = "Add line above" },
  { "[A", desc = "First arg" },
  { "[B", desc = "Prev block end" },
  { "[C", desc = "Prev conditional end" },
  { "[L", desc = "Prev loop end" },
  { "[Q", desc = "First quickfix list item" },
  { "[T", desc = "First tag" },
  { "[[", desc = "Prev class start" },
  { "[]", desc = "Prev class end" },
  { "[a", desc = "Prev arg" },
  { "[b", desc = "Prev block start" },
  { "[c", desc = "Prev conditional start" },
  { "[d", desc = "Go to prev diagnostic" },
  { "[e", desc = "Go to prev error level diagnostic" },
  { "[f", desc = "Previous file (alphabetically)" },
  { "[h", desc = "Prev hunk" },
  { "[l", desc = "Prev loop start" },
  { "[n", desc = "Previous SCM conflict marker" },
  { "[o", group = "options" },
  { "[ob", desc = "set background light" },
  { "[oc", desc = "set cursorline on" },
  { "[od", desc = "set diff on" },
  { "[oh", desc = "set hlsearch on" },
  { "[oi", desc = "set ignorecase on" },
  { "[ol", desc = "set list on" },
  { "[on", desc = "set number on" },
  { "[or", desc = "set relativenumber on" },
  { "[os", desc = "set spell on" },
  { "[ou", desc = "set cursorcolumn on" },
  { "[ov", desc = "set virtualedit on" },
  { "[ow", desc = "set wrap on" },
  { "[ox", desc = "set crosshairs on" },
  { "[q", desc = "Prev quickfix list item" },
  { "[t", desc = "Prev tag" },
  { "]<C-L>", desc = "First error of next file in loclist" },
  { "]<C-Q>", desc = "First error of next file in quickfix" },
  { "]<C-T>", desc = "Next tag in previous window" },
  { "]<Space>", desc = "Add line below" },
  { "]A", desc = "First arg" },
  { "]B", desc = "Next block end" },
  { "]C", desc = "Prev conditional end" },
  { "]E", desc = "Next call start" },
  { "]L", desc = "Last location list item" },
  { "]Q", desc = "Last quickfix list item" },
  { "]T", desc = "Last tag" },
  { "][", desc = "Next class start" },
  { "]]", desc = "Next class end" },
  { "]a", desc = "Next arg" },
  { "]b", desc = "Next block start" },
  { "]c", desc = "Next conditional start" },
  { "]d", desc = "Go to next diagnostic" },
  { "]e", desc = "Go to next error level diagnostic" },
  { "]f", desc = "Next file (alphabetically)" },
  { "]h", desc = "Next hunk" },
  { "]l", desc = "Next location list item" },
  { "]n", desc = "Next SCM conflict marker" },
  { "]o", group = "options" },
  { "]ob", desc = "set background dark" },
  { "]oc", desc = "set cursorline off" },
  { "]od", desc = "set diff off" },
  { "]oh", desc = "set hlsearch off" },
  { "]oi", desc = "set ignorecase off" },
  { "]ol", desc = "set list off" },
  { "]on", desc = "set number off" },
  { "]or", desc = "set relativenumber off" },
  { "]os", desc = "set spell off" },
  { "]ou", desc = "set cursorcolumn off" },
  { "]ov", desc = "set virtualedit off" },
  { "]ow", desc = "set wrap off" },
  { "]ox", desc = "set crosshairs off" },
  { "]q", desc = "Next quickfix list item" },
  { "]t", desc = "Next tag" },
  { "c", group = "Change" },
  { "c#", "?\\<<C-r>=expand('<cword>')<cr>\\>\\C<cr>``cgN", desc = "Word and search backward" },
  { "c*", "/\\<<C-r>=expand('<cword>')<cr>\\>\\C<cr>``cgn", desc = "Word and search forward" },
  { "ci", group = "Inner" },
  { "ciR", desc = "Org: Decrease priority of headline" },
  { "ciT", desc = "Org: Cycle TODO backwards" },
  { "cid", desc = "Org: Change inner date" },
  { "cir", desc = "Org: Increase priority of headline" },
  { "cit", desc = "Org: Cycle TODO forwards" },
  { "d", group = "Delete" },
  { "d#", "?\\<<C-r>=expand('<cword>')<cr>\\>\\C<cr>``dgN", desc = "Word and search backward" },
  { "d*", "/\\<<C-r>=expand('<cword>')<cr>\\>\\C<cr>``dgn", desc = "Word and search forward" },
  { "j", "v:count == 0 ? 'gj' : 'j'", desc = "Up (virtual) line", expr = true },
  { "k", "v:count == 0 ? 'gk' : 'k'", desc = "Down (virtual) line", expr = true },
  { "yo", group = "option" },
  { "yob", desc = "background" },
  { "yoc", desc = "cursorline" },
  { "yod", desc = "diff" },
  { "yoh", desc = "hlsearch" },
  { "yoi", desc = "ignorecase" },
  { "yol", desc = "list" },
  { "yom", "<cmd>set modifiable<cr>", desc = "Set modifiable" },
  { "yon", desc = "number" },
  { "yor", desc = "relativenumber" },
  { "yos", desc = "spell" },
  { "you", desc = "cursorcolumn" },
  { "yov", desc = "virtualedit" },
  { "yow", desc = "wrap" },
  { "yox", desc = "crosshairs" },
  { "yoz", '<cmd>if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<cr>', desc = "Toggle syntax" },
}

return spec
