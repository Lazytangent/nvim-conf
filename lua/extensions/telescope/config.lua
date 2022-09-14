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
  pickers = {
    find_files = {
      previewer = false,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    workspaces = {
      keep_insert = true,
    },
  },
})

local extensions = {
  'dap',
  'file_browser',
  'frecency',
  'fzf',
  'lazygit',
  'live_grep_args',
  'luasnip',
  'project',
  'refactoring',
  'ui-select',
  'workspaces',
  'yabs',
}

for _, extension in ipairs(extensions) do
  telescope.load_extension(extension)
end
