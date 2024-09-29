local ls = require("luasnip")

local insert = {
  { "<C-e>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, desc = "Select Choice Node"},
  { "<C-k>", ls.expand_or_jump, silent = true },

  { "<C-x>", group = "Completion modes" },
  { "<C-x>s", desc = "Snippets" },
  { "<C-x><C-b>", desc = "Buffer" },
  { "<C-x><C-n>", desc = "LSP Symbols" },
  { "<C-x><C-o>", desc = "Omni-complete" },
  { "<C-x><C-p>", desc = "Path" },
  { "<C-x><C-r>", desc = "Ripgrep" },
}

return insert
