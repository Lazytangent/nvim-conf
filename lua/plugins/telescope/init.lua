require "plugins.telescope.config"
local M = {}

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    search = vim.fn.input "Grep String > ",
  }
end

return M
