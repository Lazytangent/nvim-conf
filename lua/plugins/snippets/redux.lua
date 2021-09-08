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

local parse = require("luasnip").parser.parse_snippet

return {
  s({ trig = "thunk", dscr = "Create a thunk creator" }, {
    t "const ",
    i(1, "thunkCreator"),
    t " = (",
    i(2, "params"),
    t { ") => async (dispatch) => {", "\t" },
    i(0),
    t { "", "};" },
  }),
  s({ trig = "action", dscr = "Create a thunk creator" }, {
    t "const ",
    i(1, "actionCreator"),
    t " = (",
    i(2, "params"),
    t { ") => ({", "\t" },
    i(0),
    t { "", "});" },
  }),
  s({ trig = "sel", dscr = "Create a selector function" }, {
    t "(",
    i(1, "params"),
    t ") => (state) => ",
    i(2, "state"),
  }),
  s({ trig = "uSel", dscr = "useSelector hook", name = "useSelector" }, {
    t("const "),
    i(2, "variable"),
    t(" = useSelector((state) => state."),
    i(1),
    t(");"),
    i(0),
  }),
  s({ trig = "uD", dscr = "useDispatch hook", name = "useDispatch" }, {
    t("const dispatch = useDispatch();"),
    i(0),
  }),
  s({ trig = "state", dscr = "Selector function", name = "Selector" }, {
    t("(state) => state."),
    i(1, "slice"),
    t(");"),
    i(0),
  }),
}
