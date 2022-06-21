local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local custom_telescope = require("extensions.telescope")

vim.api.nvim_create_user_command("Find", function(opts)
  builtin.find_files({
    previewer = false,
  })
end, {
  nargs = 0,
})

vim.api.nvim_create_user_command("FindAll", function(opts)
  builtin.find_files({
    previewer = false,
    hidden = true,
  })
end, {
  nargs = 0,
})
