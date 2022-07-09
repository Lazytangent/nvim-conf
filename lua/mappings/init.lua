local normal = require('mappings.normal')
local visual = require('mappings.visual')

local command = {
}

local command_opts = {
  mode = "c",
}

local visual_opts = {
  mode = "v",
}

local insert = {
  ["<C-e>"] = {
    name = "LuaSnip Jumps",
    ["<C-n>"] = { [[<Plug>luasnip-expand-or-jump]], "Next choice" },
    ["<C-p>"] = { [[<Plug>luasnip-jump-prev]],      "Prev choice" },
    ["<C-u>"] = { [[<cmd>lua require("luasnip.extras.select_choice")()<cr>]], "Select Choice Node" },
  },
}

local insert_opts = {
  mode = "i",
}

local visual_only = {
  g = {
    a = { [[<Plug>(EasyAlign)]], "Easy Align" },
  },
}

local visual_only_opts = {
  mode = "x",
}

local select = {
  ["<C-e>"] = {
    name = "LuaSnip Jumps",
    ["<C-n>"] = { [[<Plug>luasnip-expand-or-jump]], "Next choice" },
    ["<C-p>"] = { [[<Plug>luasnip-jump-prev]],      "Prev choice" },
  },
  ["<C-u>"] = { [[<cmd>lua require("luasnip.extras.select_choice")()<cr>]], "Select Choice Node" },
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
  ["<C-W>"] = { util('<C-\\><C-N><C-W>'),    "Window movement" },
  ["<C-#>"] = { util('<C-\\><C-N>:bd!<cr>'), "Close terminal" },
}

local terminal_opts = {
  mode = "t",
}

local wk = require "which-key"

wk.register(normal)
wk.register(visual,      visual_opts)
wk.register(insert,      insert_opts)
wk.register(select,      select_opts)
wk.register(terminal,    terminal_opts)
wk.register(visual_only, visual_only_opts)

-- wk.register(operator, operator_opts)
-- wk.register(command,  command_opts)
