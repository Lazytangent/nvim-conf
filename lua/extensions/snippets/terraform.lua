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
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local terraform = {
  s({ trig = "var", dscr = "Variable Declaration", name = "Variable Declaration" },
    fmta(
      [[
      variable "<>" {
        <>
      }
      ]],
      { i(1, "name"), i(0) }
    )
  ),
  s({ trig = "pro", dscr = "Provider Block", name = "Provider" },
    fmta(
      [[
      provider "<>" {
        <>
      }
      ]],
      { i(1, "name"), i(0) }
    )
  ),
  s({ trig = "res", dscr = "Resource Block", name = "Resource" },
    fmta(
      [[
      resource "<>" "<>" {
        <>
      }
      ]],
      { i(1, "type"), i(2, "name"), i(0) }
    )
  ),
}

return terraform
