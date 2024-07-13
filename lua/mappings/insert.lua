local insert = {
  { "<C-e>", group = "LuaSnip Jumps", },
  { "<C-e><C-n>", [[<Plug>luasnip-expand-or-jump]], desc = "Next choice" },
  { "<C-e><C-p>", [[<Plug>luasnip-jump-prev]],      desc = "Prev choice" },
  { "<C-e><C-u>", [[<cmd>lua require("luasnip.extras.select_choice")()<cr>]], desc = "Select Choice Node" },

  { "<C-x>", group = "Completion modes" },
  { "<C-x>s", desc = "Snippets" },
  { "<C-x><C-b>", desc = "Buffer" },
  { "<C-x><C-n>", desc = "LSP Symbols" },
  { "<C-x><C-o>", desc = "Omni-complete" },
  { "<C-x><C-p>", desc = "Path" },
  { "<C-x><C-r>", desc = "Ripgrep" },
}

return insert
