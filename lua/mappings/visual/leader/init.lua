local utils = require("mappings.utils")

local leader = {
  r = {
    name = "Refactoring",
    r = { table.concat({ "<Esc>", utils.telescope_extensions("refactoring.refactors()") }), "Refactoring Options" },
    v = { utils.lua_require("refactoring", "debug.print_var({})"), "Print var" },
  },
}

return leader
