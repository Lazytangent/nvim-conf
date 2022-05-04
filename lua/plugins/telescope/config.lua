require("telescope").setup({
  defaults = require('telescope.themes').get_ivy({
    file_ignore_patterns = { "^node_modules/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
      }
    },
  }),
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
  },
})

-- require("telescope").load_extension('projects')
require("telescope").load_extension('fzf')
require("telescope").load_extension('frecency')
require("telescope").load_extension('file_browser')
require("telescope").load_extension('ui-select')
require("telescope").load_extension('dap')
require("telescope").load_extension('lazygit')
require("telescope").load_extension('luasnip')
