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

local javascript = {
	s({ trig = "ctx", dscr = "Create Context" }, {
		t("const "),
		i(1, "NameOfContext"),
		t({ " = createContext();", "export const " }),
		i(2, "useContextHook"),
		t(" = () => useContext("),
		f(copy, 1),
		t({ ");", "", "const " }),
		i(3, "ContextProvider"),
		t({ " = ({ children }) => {", "\t" }),
		i(0),
		t({ "", "\treturn (", "\t\t<" }),
		f(copy, 1),
		t(".Provider value={{"),
		i(4),
		t({ "}}>", "\t\t\t{children}", "\t\t</" }),
		f(copy, 1),
		t({ ".Provider>", "\t);", "};", "", "export default " }),
		f(copy, 3),
		t(";"),
	}),
}

local redux = require('redux')
vim.list_extend(javascript, redux)

return javascript
