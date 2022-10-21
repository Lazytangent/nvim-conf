local utils = require("mappings.utils")

local leader = {
  r = {
    name = "Refactoring",
    r = { table.concat({ "<Esc>", utils.telescope_extensions("refactoring.refactors()") }), "Refactoring Options" },
    v = { utils.lua_require("refactoring", "debug.print_var({})"), "Print var" },
  },
  s = {
    name = "Send to Iron REPL",
    c = "Send selection to REPL",
  },
}

return leader
