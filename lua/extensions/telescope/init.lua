require "extensions.telescope.config"
local M = {}

function M.search_all_files()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--no-ignore", "--hidden", "--files", "--no-heading", "--with-filename", "--line-number", "--column" },
  }
end

return M
