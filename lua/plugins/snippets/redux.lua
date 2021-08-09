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
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda

local parse = require("luasnip").parser.parse_snippet

return {
	s({ trig = "thunk", dscr = "Create a thunk creator" }, {
		t("const "),
		i(1, "thunkCreator"),
		t(" = ("),
		i(2, "params"),
		t({ ") => async (dispatch) => {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s({ trig = "action", dscr = "Create a thunk creator" }, {
		t("const "),
		i(1, "actionCreator"),
		t(" = ("),
		i(2, "params"),
		t({ ") => ({", "\t" }),
		i(0),
		t({ "", "});" }),
	}),
}
