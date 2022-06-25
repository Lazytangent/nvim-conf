local utils = require('mappings.utils')

local g = {
  name = "+Git",
  c = { utils.cmd "Git commit", "commit" },
  f = { utils.cmd "Git fetch",  "fetch" },
  g = { utils.cmd "Git",        "status" },
  l = { utils.cmd "Git pull",   "pull" },
  L = { utils.cmd "Git log",    "log" },
  p = { utils.cmd "Git push",   "push" },
  P = {
    name = "+Push",
    m = { utils.cmd "Git push -u origin main", "main" },
    p = { [[:Git push -u origin<space>]],       "branch" },
  },
  s = { utils.cmd "Git",       "status" },
  w = { utils.cmd "Gw",        "write" },
  S = { utils.cmd "Git stash", "stash file" },

  t = {
    name = "Toggle",
    b = { utils.gitsigns "toggle_current_line_blame()", "Toggle blame" },
    d = { utils.gitsigns "toggle_deleted()", "Toggle deleted" },
    n = { utils.gitsigns "toggle_numhl()", "Toggle number hl" },
    s = { utils.gitsigns "toggle_signs()", "Toggle signs" },
    w = { utils.gitsigns "toggle_word_diff()", "Toggle word diff" },
  },
}

return g
