local builtin = require "telescope.builtin"

local M = {}

M.files = function()
  builtin.find_files {
    prompt_title = "Java Files",
    find_command = { "rg", "--files", "--color", "never", "--glob", "*.java" },
  }
end

M.build_files = function()
  builtin.find_files {
    prompt_title = "Java Build Files",
    find_command = { "fd", "--type", "file", "build.gradle|Makefile" }
  }
end

return M
