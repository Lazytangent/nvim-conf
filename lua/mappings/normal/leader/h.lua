local telescope = require 'telescope.builtin'

return {
  { "<leader>h",  group = "Help" },
  { "<leader>hh", telescope.help_tags, desc = "Help Tags" },
  { "<leader>hk", telescope.keymaps,   desc = "Keymaps" },
}
