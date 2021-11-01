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

return {
  s({ trig = "vv", dscr = "Set up Vue file", name = "Set up Vue file" }, {
    t({ "<template>", "\t" }),
    i(1),
    t({ "", "</template>", "", "<script>", "\texport default {", "\t\t" }),
    i(2),
    t({ "", "\t}", "</script>", "", "<style></style>" })
  }),
}
