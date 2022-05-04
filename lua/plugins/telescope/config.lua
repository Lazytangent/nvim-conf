require("telescope").setup({
  defaults = require('telescope.themes').get_ivy({
    file_ignore_patterns = { "^node_modules/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
      }
    },
  }),
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            vim.cmd(string.format("silent cd %s", dir))
          end
        },
      },
    },
  },
  extensions = {
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
