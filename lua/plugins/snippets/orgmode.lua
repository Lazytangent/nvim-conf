local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local m = require("luasnip.extras").match
local p = require("luasnip.extras").partial
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda

local parse = require("luasnip").parser.parse_snippet

local function copy(args)
  return args[1]
end

local function dynamic_copy(args, old_state)
  if not old_state then
    old_state = {}
  end

  local node = i(1, args[1])
  local snip = sn(nil, node)
  snip.old_state = old_state
  return snip
end

local orgmode = {
  s({ trig = "bsrc", dscr = "#+BEGIN_SRC $1", name = "Create SRC block" }, {
    t("#+BEGIN_SRC "),
    i(1, "language"),
    t({ "", "" }),
    i(0),
    t({ "", "#+END_SRC" }),
  }),
  s({ trig = "title", dscr = "#+TITLE: ", name = "Create title" }, {
    t("#+TITLE: "),
    i(1, "title"),
  }),
  s({ trig = "beg", dscr = "#+BEGIN_$1", name = "Create environment" }, {
    t("#+BEGIN_"),
    i(1),
    t({ "", "" }),
    i(0),
    t({ "", "#+END_" }),
    f(copy, 1),
  }),
}

return orgmode