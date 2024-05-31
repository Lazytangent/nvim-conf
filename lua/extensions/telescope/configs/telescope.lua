local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
  defaults = require('telescope.themes').get_ivy({
    file_ignore_patterns = { "^node_modules/", "%.class" },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-/>"] = require("telescope.actions").which_key,
        ["<M-w>"] = require("telescope.actions").smart_add_to_loclist,
        ["<C-t>"] = require("trouble.sources.telescope").open,
      },
      n = {
        ["<C-t>"] = require("trouble.sources.telescope").open,
      }
    },
  }),
  pickers = {
    find_files = {
      previewer = false,
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    workspaces = {
      keep_insert = true,
    },
  },
})

local extensions = {
  'ast_grep',
  'dap',
  'file_browser',
  'frecency',
  'fzf',
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
