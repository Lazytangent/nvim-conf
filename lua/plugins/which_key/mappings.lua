local normal = {
  ["<leader>"] = {
    b = {
      name = "+Buffers",
      d = { [[<cmd>%bdelete<cr>]], "Close buffers" },
      l = { [[<cmd>bnext<cr>]], "next buffer" },
      h = { [[<cmd>bprevious<cr>]], "prev buffer" },
    },
    c = {
      name = "+Change",
      c = { [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], "colorscheme" },
      d = { [[<cmd>cd %:p:h<cr>]], "Change working directory" },
      t = { [[<cmd>!ctags -R .<cr><cr>]], "Ctags" },
    },
    f = {
      name = "+Telescope",
      a = { [[<cmd>lua require('plugins.telescope').search_all_files()<cr>]], "All files" },
      b = { [[<cmd>lua require('telescope.builtin').file_browser()<cr>]], "File browser" },
      d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "Definitions" },
      f = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], "Fuzzy find" },
      g = { [[<cmd>lua require('telescope.builtin').git_status()<cr>]], "Git" },
      i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "Implementations" },
      p = { [[<cmd>lua require('telescope.builtin').resume()<cr>]], "Resume" },
      P = { [[<cmd>lua require('telescope.builtin').pickers()<cr>]], "Previous pickers" },
      r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "References" },
      t = { [[<cmd>lua require('telescope.builtin').tags()<cr>]], "Tags" },
    },
    g = { [[<cmd>lua require('plugins.telescope').grep_prompt()<cr>]], "Grep String" },
    j = { [[:jumps<cr>]], "Show jumps" },
    l = { [[:ls<cr>:b<space>]], "Select buffer" },
    m = { [[:marks<cr>:normal! `]], "Show marks" },
    n = {
      name = "+NvimTree",
      f = { [[:NvimTreeFindFile<space>]], "Find" },
      n = { [[<cmd>NvimTreeToggle<cr>]], "Toggle" },
    },
    q = "Quit",
    Q = { [[!!zsh<cr>]], "Run line through zsh" },
    s = {
      name = "+Spell",
      ["?"] = { [[z=]], "Spelling suggestions" },
      a = { [[zg]], "Add word to good spelling list" },
      n = { [[]s]], "Next bad spelling" },
      p = { [[[s]], "Prev bad spelling" },
      s = { [[<cmd>setlocal spell!<cr>]], "Toggle spellcheck" },
    },
    t = {
      name = "+Tabs",
      c = { [[<cmd>tabclose<cr>]], "Close tab" },
      e = { [[:tabedit <C-r>=expand("%:p:h")<cr>/<cr>]], "Edit tab" },
      m = { [[<cmd>tabmove<cr>]], "Move tab" },
      n = { [[<cmd>tabnew<cr>]], "New tab" },
      o = { [[<cmd>tabonly<cr>]], "Only tab" },
      w = "Tailwind Complete",
    },
    w = { [[<cmd>w<cr>]], "Write" },
    ["<CR>"] = { [[<cmd>nohlsearch<cr>]], "Turn off highlight" },
    [","] = {
      name = "+Utilities",
      c = { [[:changes<cr>]], "Show changes" },
      f = { [[<cmd>lua vim.lsp.buf.formatting()<cr>]], "Format" },
      g = { [[:set operatorfunc=GrepOperator<cr>g@]], "Grep for word under cursor" },
      p = { [[<cmd>Telescope projects<cr>]], "Open Project" },
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
    ["<localleader>"] = {
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
      w = {
        name = "+LSP Workspace",
        a = "Add workspace folder",
        r = "Remove workspace folder",
        l = "List workspace folders",
      }
    },
  },
  ["<localleader>"] = {
    a = {
      name = "Add",
      O = { [[O<Esc>]], "Add new line above" },
      o = { [[o<Esc>]], "Add new line below" },
    },
    c = {
      name = "+Open",
      c = { [[<cmd>copen<cr>]], "Quickfix" },
      l = { [[<cmd>lopen<cr>]], "Location" },
    },
    e = "Show line diagnostics",
    f = {
      name = "+Telescope",
      a = { [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]], "Frecency" },
      b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "Find Buffers" },
      c = { [[<cmd>lua require('telescope.builtin').commands()<cr>]], "Commands" },
      d = { [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>]], "Document diagnostics" },
      f = { [[<cmd>lua require('telescope.builtin').find_files()<cr>]], "Find files" },
      g = { [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], "Live grep" },
      h = { [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], "Help tags" },
      j = { [[<cmd>lua require('telescope.builtin').jumplist()<cr>]], "Jumplist" },
      l = { [[<cmd>lua require('telescope.builtin').loclist()<cr>]], "Location list" },
      p = { [[<cmd>lua require('telescope.builtin').planets()<cr>]], "Planets" },
      q = { [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], "Quickfix list" },
      r = { [[<cmd>lua require('telescope.builtin').registers()<cr>]], "Registers" },
      t = { [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], "Treesitter" },

      s = { [[<cmd>w<cr>]], "Save file" },
    },
    g = {
      name = "+Git",
      c = { [[<cmd>Git commit<cr>]], "commit" },
      f = { [[<cmd>Git fetch<cr>]], "fetch" },
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
    m = {
      name = "+MarkdownPreview",
      d = { [[<cmd>InstantMarkdownPreview<cr>]], "Preview Start" },
      s = { [[<cmd>InstantMarkdownStop<cr>]], "Preview Stop" },
    },
    n = {
      name = "+Number",
      n = { [[<cmd>set nu!<cr>]], "Toggle number" },
      r = { [[<cmd>set rnu!<cr>]], "Toggle relative" },
    },
    p = { [[<cmd>Prettier<cr>]], "Prettier" },
    q = "Set diagnostics into location list",
    r = { [[<cmd>Reload<cr>]], "Reload nvim config" },
    t = {
      name = "+Tags",
      t = { [[<cmd>TagbarToggle<cr>]], "Toggle Tagbar" },
    },
    w = {
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
    ["<localleader>"] = {
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
      t = {
        name = "+Tests",
        f = { [[<cmd>TestFile]], "Test File" },
        l = { [[<cmd>TestLast]], "Test Last" },
        n = { [[<cmd>TestNearest]], "Test Nearest" },
        s = { [[<cmd>TestSuite]], "Test Suite" },
        v = { [[<cmd>TestVisit]], "Test Visit" },
      },
    },
  },
  ["g"] = {
    c = "Commentary",
    s = "Sort motion",

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
  ["t"] = {
    name = "Test",
    ["<C-n>"] = { [[<cmd>TestNearest<cr>]], "Test nearest" },
    ["<C-f>"] = { [[<cmd>TestFile<cr>]], "Test file" },
    ["<C-s>"] = { [[<cmd>TestSuite<cr>]], "Test suite" },
    ["<C-l>"] = { [[<cmd>TestLast<cr>]], "Test last" },
    ["<C-g>"] = { [[<cmd>TestVisit<cr>]], "Test visit" },
  },
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
