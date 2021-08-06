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

ls.config.set_config({
	history = true,
})

local function copy(args)
	return args[1]
end

local rec_ls
rec_ls = function()
	return sn(
		nil,
		c(1, {
			t(""),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
		})
	)
end

ls.snippets = {
	all = {
		s("func", {
			t("// Parameters: "),
			f(copy, 2),
			t({ "", "function " }),
			i(1),
			t("("),
			i(2, "int foo"),
			t({ ") {", "\t" }),
			i(0),
			t({ "", "}" }),
		}),
		s("class", {
			c(1, {
				t("public "),
				t("private "),
			}),
			t("class "),
			i(2),
			t(" "),
			c(3, {
				t("{"),
				sn(nil, {
					t("expands "),
					i(1),
					t(" {"),
				}),
				sn(nil, {
					t("implements "),
					i(1),
					t(" {"),
				}),
			}),
			t({ "", "\t" }),
			i(0),
			t({ "", "}" }),
		}),
		ls.parser.parse_snippet("lspsyn", "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"),
		ls.parser.parse_snippet({ trig = "ter", wordTrig = false }, "${1:cond} ? ${2:true} : ${3:false} "),
	},
}

require("luasnip/loaders/from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip/loaders/from_vscode").lazy_load()
