local insert = {
  ["<C-e>"] = {
    name = "LuaSnip Jumps",
    ["<C-n>"] = { [[<Plug>luasnip-expand-or-jump]], "Next choice" },
    ["<C-p>"] = { [[<Plug>luasnip-jump-prev]],      "Prev choice" },
    ["<C-u>"] = { [[<cmd>lua require("luasnip.extras.select_choice")()<cr>]], "Select Choice Node" },
  },
  ["<C-x>"] = {
    name = "Completion modes",
    ["s"] = "Snippets",
    ["<C-b>"] = "Buffer",
    ["<C-n>"] = "LSP Symbols",
    ["<C-o>"] = "Omni-complete",
    ["<C-p>"] = "Path",
    ["<C-r>"] = "Ripgrep",
  },
}

return insert
