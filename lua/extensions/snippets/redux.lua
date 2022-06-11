local ls = require "luasnip"
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

local parse = require("luasnip").parser.parse_snippet

return {
  s({ trig = "thunk", dscr = "Create a thunk creator" },
    fmt(
      [[
      const {thunkCreator} = ({params}) => async (dispatch) => {{
        {}
      }};
      ]],
      { thunkCreator = i(1, "thunkCreator"), params = i(2, "params"), i(0) }
    )
  ),
  s({ trig = "action", dscr = "Create an action creator" },
    fmt(
      [[
      const {actionCreator} = ({params}) => ({{
        {}
      }})
      ]],
      { actionCreator = i(1, "actionCreator"), params = i(2, "params"), i(0) }
    )
  ),
  s({ trig = "sel", dscr = "Create a selector function" },
    fmt("({params}) => (state) => {state}",
      { params = i(1, "params"), state = i(2, "state") }
    )
  ),
  s({ trig = "uS", dscr = "useSelector hook", name = "useSelector" },
    fmt("const {variable} = useSelector((state) => state.{});{}",
      { variable = i(2, "variable"), i(1), i(0) }
    )
  ),
  s({ trig = "uD", dscr = "useDispatch hook", name = "useDispatch" },
    t("const dispatch = useDispatch();"),
    i(0)
  ),
  s({ trig = "state", dscr = "Selector function", name = "Selector" },
    fmt("(state) => state.{slice}", { slice = i(1, "slice") })
  ),
}
