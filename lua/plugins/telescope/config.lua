require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    file_ignore_patterns = { "^node_modules/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {},
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
  },
})

-- require("telescope").load_extension('projects')
require("telescope").load_extension('fzf')
require("telescope").load_extension('project')
require("telescope").load_extension('frecency')
require("telescope").load_extension('file_browser')
require("telescope").load_extension('ui-select')
