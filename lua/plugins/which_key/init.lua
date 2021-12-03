require("which-key").setup {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  key_labels = {
    ["<leader>"] = "SPC",
    ["<localleader>"] = "SPC m",
    ["<space>"] = "SPC",
  },
}

require("plugins.which_key.mappings")
