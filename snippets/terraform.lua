local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
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
