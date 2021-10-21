require("which-key").setup {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
}

require("plugins.which_key.mappings")
