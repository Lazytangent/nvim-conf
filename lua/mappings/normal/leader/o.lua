return {
  name = "+Open",
  c = { [[<cmd>copen<cr>]],         "Quickfix" },
  l = { [[<cmd>lopen<cr>]],         "Location" },
  p = { [[<cmd>NvimTreeFocus<cr>]], "Project in NvimTree" },

  -- Org Mode
  e = "Org: Export",
  i = {
    name = "Insert",
    d = "Deadline",
    h = "Heading",
    s = "Schedule",

    ["."] = "Timestamp",
    ["!"] = "Timestamp Inactive",

    T = "TODO Heading",
  },
  k = "Org SRC: Abort changes",
  o = "Org: Open at point",
  r = "Org: Refile",
  t = "Org: Set tags on current headline",
  x = {
    name = "Clock",
    e = "Org: Set Effort",
    i = "Org: Clock in",
    j = "Org: Clock GoTo",
    o = "Org: Clock out",
    q = "Org: Cancel Clock",
  },
  w = "Org SRC: Write changes",

  A = "Org: Archive current headline",
  J = "Org: Move subtree down",
  K = "Org: Move subtree up",

  [","] = "Org: Change priority",
  ["'"] = "Org: Edit special",
  ["$"] = "Org: Archive subtree",
}
