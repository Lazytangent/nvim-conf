local telescope = require("telescope")

telescope.setup({
  defaults = require('telescope.themes').get_ivy({
    file_ignore_patterns = { "^node_modules/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-/>"] = require("telescope.actions").which_key,
        ["<M-w>"] = require("telescope.actions").smart_add_to_loclist,
      }
    },
  }),
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    workspaces = {
      keep_insert = true,
    },
  },
})

telescope.load_extension('dap')
telescope.load_extension('file_browser')
telescope.load_extension('frecency')
telescope.load_extension('fzf')
telescope.load_extension('lazygit')
telescope.load_extension('live_grep_args')
telescope.load_extension('luasnip')
telescope.load_extension('ui-select')
telescope.load_extension('workspaces')
telescope.load_extension('yabs')
