local utils = require("mappings.utils")

local leader = {
  { "<leader>r", group = "Refactoring" },
  { "<leader>r", table.concat({ "<Esc>", utils.telescope_extensions("refactoring.refactors()") }), desc = "Refactoring Options" },
  { "<leader>v", utils.lua_require("refactoring", "debug.print_var({})"), desc = "Print var" },
  { "<leader>sc", desc = "Send selection to REPL" },
}

return leader
