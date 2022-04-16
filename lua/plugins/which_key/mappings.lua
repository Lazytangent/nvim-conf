local normal = {
  ["<leader>"] = {
    ["<leader>"] = {
      name = "+LSP",
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
      t = {
        name = "+Tests",
        f = { [[<cmd>TestFile]], "Test File" },
        l = { [[<cmd>TestLast]], "Test Last" },
        n = { [[<cmd>TestNearest]], "Test Nearest" },
        s = { [[<cmd>TestSuite]], "Test Suite" },
        v = { [[<cmd>TestVisit]], "Test Visit" },
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
      f = { [[<cmd>lua vim.lsp.buf.formatting()<cr>]], "Format" },
      g = { [[:set operatorfunc=GrepOperator<cr>g@]], "Grep for word under cursor" },
      p = { [[:! pre-commit run --files %<cr>]], "Run pre-commit on current file" },
      r = { [[<cmd>lua require('mdeval').eval_code_block()<cr>]], "Run code block with mdeval" },
      t = {
        name = "+Terminal",
        b = { [[:15split | term<cr>]], "Bottom terminal" },
        n = { [[:Term<cr>]], "25 height botton" },
        t = { [[<cmd>NeotermToggle<cr>]], "Toggle Neoterm" },
        r = { [[:NeotermRun<space>]], "Run Neoterm" },
        x = { [[<cmd>NeotermExit<cr>]], "Exit Neoterm" },
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
    d = {
      name = "+Debugger",
      c = { [[<cmd>lua require('dap').continue()<cr>]], "Continue" },
      i = { [[<cmd>lua require('dap').step_into()<cr>]], "Step Into" },
      o = { [[<cmd>lua require('dap').step_over()<cr>]], "Step Over" },
      r = { [[<cmd>lua require('dap').repl_open()<cr>]], "Open REPL" },
      t = { [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], "Toggle breakpoint" },
      p = { [[<cmd>lua require('plugins.dap').configure_python_debugger()<cr>]], "Attach Python Debugger" },

      f = {
        name = "+Telescope",
        c = { [[<cmd>lua require('telescope').extensions.dap.commands()<cr>]], "Commands" },
        f = { [[<cmd>lua require('telescope').extensions.dap.frames()<cr>]], "Frames" },
        l = { [[<cmd>lua require('telescope').extensions.dap.list_breakpoints()<cr>]], "List Breakpoints" },
        o = { [[<cmd>lua require('telescope').extensions.dap.configurations()<cr>]], "Configurations" },
        v = { [[<cmd>lua require('telescope').extensions.dap.variables()<cr>]], "Variables" },
      },
      u = {
        name = "UI",
        c = { [[<cmd>lua require('dapui').close()<cr>]], "Close" },
        o = { [[<cmd>lua require('dapui').open()<cr>]], "Open" },
        t = { [[<cmd>lua require('dapui').toggle()<cr>]], "Toggle" },
      },
    },
    e = "Show line diagnostics",
    f = {
      name = "+Telescope",
      a = { [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]], "Frecency" },
      b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "Find Buffers" },
      c = { [[<cmd>lua require('telescope.builtin').commands()<cr>]], "Commands" },
      f = { [[<cmd>lua require('telescope.builtin').find_files()<cr>]], "Find files" },
      g = { [[<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>]], "Live grep" },
      h = { [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], "Help tags" },
      i = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], "In buffer" },
      j = { [[<cmd>lua require('telescope.builtin').jumplist()<cr>]], "Jumplist" },
      l = { [[<cmd>lua require('telescope.builtin').loclist()<cr>]], "Location list" },
      m = { [[<cmd>lua require('telescope.builtin').marks()<cr>]], "Marks" },
      p = { [[<cmd>lua require('telescope.builtin').planets()<cr>]], "Planets" },
      q = { [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], "Quickfix list" },
      t = { [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], "Treesitter" },

      z = {
        name = "+LSP Specific",
        d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "LSP Definitions" },
        i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "LSP Implementations" },
        r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "LSP References" },
      },

      s = { [[<cmd>w<cr>]], "Save file" },
    },
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
      S = { [[<cmd>Gwrite<cr>]], "stash file" },
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
      n = {
        name = "+NPM",
        d = { [[<cmd>lua require('package-info').delete()<cr>]], "Delete a package" },
        i = { [[<cmd>lua require('package-info').install()<cr>]], "Install new package" },
        r = { [[<cmd>lua require('package-info').reinstall()<cr>]], "Reinstall packages" },
        s = { [[<cmd>lua require('package-info').show()<cr>]], "Show outdated versions" },
        v = { [[<cmd>lua require('package-info').change_version()<cr>]], "Change version" },
      },
      o = {
        name = "+Octo",
        i = {
          name = "+Issues",
          b = { [[<cmd>Octo issue browser<cr>]], "Open in browser" },
          c = { [[<cmd>Octo issue create<cr>]], "Create issue" },
          d = { [[<cmd>Octo issue close<cr>]], "Close issue" },
          e = { [[<cmd>Octo issue edit<cr>]], "Edit issue" },
          l = { [[<cmd>Octo issue list<cr>]], "List issues" },
          s = { [[<cmd>Octo issue search<cr>]], "Search" },
        },
        p = {
          name = "+Pull Requests",
          b = { [[<cmd>Octo pr browser<cr>]], "Open in browser" },
          c = { [[<cmd>Octo pr create<cr>]], "Create PR" },
          d = { [[<cmd>Octo pr close<cr>]], "Close PR" },
          e = { [[<cmd>Octo pr edit<cr>]], "Edit PR" },
          h = { [[<cmd>Octo pr checkout<cr>]], "Checkout PR" },
          l = { [[<cmd>Octo pr list<cr>]], "List PR" },
          m = { [[<cmd>Octo pr merge<cr>]], "Merge PR" },
          s = { [[<cmd>Octo pr search<cr>]], "Search" },
        },
      },
      Q = { [[!!zsh<cr>]], "Run line through zsh" },
      t = {
        name = "+TableMode",
        m = "Toggle table mode",
        t = "Tableize",
      },
      ["<CR>"] = { [[<cmd>nohlsearch<cr>]], "Turn off highlight" },
    },
    n = {
      name = "+Number",
      n = { [[<cmd>set nu!<cr>]], "Toggle number" },
      r = { [[<cmd>set rnu!<cr>]], "Toggle relative" },
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
      ["?"] = { [[z=]], "Spelling suggestions" },
      a = { [[zg]], "Add word to good spelling list" },
      n = { [[]s]], "Next bad spelling" },
      p = { [[[s]], "Prev bad spelling" },
      s = { [[<cmd>setlocal spell!<cr>]], "Toggle spellcheck" },
    },
    w = {
      name = "+Write",
      q = { [[<cmd>wq<cr>]], "write and quit" },
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
    ["<leader>"] = {
      name = "+Utilities",
      l = {
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
    },
    ["`"] = { [[<C-^>]], "Prev buffer" },
  },
  ["g"] = {
    c = "Commentary",

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
  ["<C-n>"] = "Visual Multi",
  ["<C-L>"] = {
    name = "+Local commands",
    ["<C-R>"] = { [[:call ExecuteFile()<cr>]], "Run current file" },
  },
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

local comamnd = {
}

local command_opts = {
  mode = "c",
}

local visual = {
  ["<C-k>"] = { [[:<C-U>exec "'<,'>move '<-" . (1+v:count1)<cr>gv]], "Move line up" },
  ["<C-j>"] = { [[:<C-U>exec "'<,'>move '>+" . (0+v:count1)<cr>gv]], "Move line down" },
  ["<S-h>"] = { [[<cmd>DVB_Drag('left')]], "Drag left" },
  ["<S-l>"] = { [[<cmd>DVB_Drag('right')]], "Drag right" },
  ["<S-j>"] = { [[<cmd>DVB_Drag('down')]], "Drag down" },
  ["<S-k>"] = { [[<cmd>DVB_Drag('up')]], "Drag up" },
  ["<leader>"] = {
    ["<leader>"] = {
      name = "+Utilities",
      g = { [[:<C-u>call GrepOperator(visualmode())<cr>]], "Grep for selection" },
    },
  },
}

local visual_opts = {
  mode = "v",
}

local insert = {
  ["<C-e>"] = {
    name = "LuaSnip Jumps",
    ["<C-n>"] = { [[<Plug>luasnip-expand-or-jump]], "Next choice" },
    ["<C-p>"] = { [[<Plug>luasnip-jump-prev]], "Prev choice" },
  },
}

local insert_opts = {
  mode = "i",
}

local select = {
  ["<C-e>"] = {
    name = "LuaSnip Jumps",
    ["<C-n>"] = { [[<Plug>luasnip-expand-or-jump]], "Next choice" },
    ["<C-p>"] = { [[<Plug>luasnip-jump-prev]], "Prev choice" },
  },
}

local select_opts = {
  mode = "s",
}

local operator = {
  ["i"] = {
    name = "+Inner",
    n = {
      name = "+Next",
      ["("] = { [[:<C-u>normal! f(vi(<cr>]], "Parentheses" },
      [")"] = { [[:<C-u>normal! f)vi(<cr>]], "Parentheses" },
      ["b"] = { [[:<C-u>normal! f(vi(<cr>]], "Parentheses" },

      ["{"] = { [[:<C-u>normal! f{vi{<cr>]], "Curly Braces" },
      ["}"] = { [[:<C-u>normal! f}vi{<cr>]], "Curly Braces" },
      ["B"] = { [[:<C-u>normal! f{vi{<cr>]], "Curly Braces" },

      ["["] = { [[:<C-u>normal! f[vi[<cr>]], "Square Brackets" },
      ["]"] = { [[:<C-u>normal! f]vi[<cr>]], "Square Brackets" },
    },
    l = {
      name = "+Last",
      ["("] = { [[:<C-u>normal! F(vi(<cr>]], "Parentheses" },
      [")"] = { [[:<C-u>normal! F)vi(<cr>]], "Parentheses" },
      ["b"] = { [[:<C-u>normal! F(vi(<cr>]], "Parentheses" },

      ["{"] = { [[:<C-u>normal! F{vi{<cr>]], "Curly Braces" },
      ["}"] = { [[:<C-u>normal! F}vi{<cr>]], "Curly Braces" },
      ["B"] = { [[:<C-u>normal! F{vi{<cr>]], "Curly Braces" },

      ["["] = { [[:<C-u>normal! F[vi[<cr>]], "Curly Braces" },
      ["]"] = { [[:<C-u>normal! F]vi[<cr>]], "Curly Braces" },
    },
  },
}

local operator_opts = {
  mode = "o",
}

local util = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local terminal = {
  ["<C-W>"] = { util('<C-\\><C-N><C-W>'), "Window movement" },
  ["<C-#>"] = { util('<C-\\><C-N>:bd!<cr>'), "Close terminal" },
}

local terminal_opts = {
  mode = "t",
}

local wk = require "which-key"

wk.register(normal)
wk.register(visual, visual_opts)
wk.register(insert, insert_opts)
wk.register(select, select_opts)
wk.register(terminal, terminal_opts)

-- wk.register(operator, operator_opts)
-- wk.register(command, command_opts)
