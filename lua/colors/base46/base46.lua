local M = {}

M.get_colors = function(type)
   local name = "radium"

   -- theme paths
   local default_path = "colors.base46.hl_themes." .. name

   local present1, default_theme = pcall(require, default_path)

   if present1 then
      return default_theme[type]
   else
      error "No such theme bruh >_< "
   end
end

M.merge_tb = function(table1, table2)
   return vim.tbl_deep_extend("force", table1, table2)
end

M.load_theme = function()
   -- clear highlights of bufferline (cuz of dynamic devicons hl group on the buffer)
   local highlights_raw = vim.split(vim.api.nvim_exec("filter BufferLine hi", true), "\n")
   local highlight_groups = {}

   for _, raw_hi in ipairs(highlights_raw) do
      table.insert(highlight_groups, string.match(raw_hi, "BufferLine%a+"))
   end

   for _, highlight in ipairs(highlight_groups) do
      vim.cmd([[hi clear ]] .. highlight)
   end
   -- above highlights clear code by https://github.com/max397574

   -- reload highlights for theme switcher
   require("plenary.reload").reload_module "colors.base46.integrations"
   require("plenary.reload").reload_module "colors.base46.chadlights"

   require "colors.base46.chadlights"
end

return M
