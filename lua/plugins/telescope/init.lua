require "plugins.telescope.config"
local M = {}

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    search = vim.fn.input "Grep String > ",
  }
end

function M.search_all_files()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--no-ignore", "--files" },
  }
end

function M.lsp_references()
  require("telescope.builtin").lsp_references {}
end

function M.lsp_implementations()
  require("telescope.builtin").lsp_implementations {}
end

return M
