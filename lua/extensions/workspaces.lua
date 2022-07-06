require("workspaces").setup({
  hooks = {
    open = { "Telescope find_files" },
  },
})
