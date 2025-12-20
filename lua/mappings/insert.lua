local ls = require("luasnip")

local insert = {
  { "<C-e>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, desc = "Select Choice Node"},
  { "<C-S-e>", function()
    if ls.choice_active() then
      ls.change_choice(-1)
    end
  end, desc = "Select Choice Node (backwards)"},
  -- { "<C-k>", ls.expand_or_jump, silent = true },
  { "<C-j>", ls.expand_or_jump, silent = true }, -- Doesn't seem to also overwrite <CR> (RET)
  { "<C-h>", "<cmd>lua require('better-digraphs').digraphs('insert')<cr>" },

  { "<C-x>", group = "Completion modes" },
  { "<C-x>s", desc = "Snippets" },
  { "<C-x><C-b>", desc = "Buffer" },
  { "<C-x><C-n>", desc = "LSP Symbols" },
  { "<C-x><C-o>", desc = "Omni-complete" },
  { "<C-x><C-p>", desc = "Path" },
  { "<C-x><C-r>", desc = "Ripgrep" },

  { "<C-Space>", "<nop>", desc = "No-op" },
  { "<C-l><C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u" },
}

return insert
