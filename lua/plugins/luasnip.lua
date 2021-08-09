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
	updateevents = "TextChangedI",
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

local tex = require('plugins.snippets.tex')
local javascript = require('plugins.snippets.javascript')

ls.snippets = {
	-- General Snippets
	all = {
		ls.parser.parse_snippet({ trig = "ter", wordTrig = false }, "${1:cond} ? ${2:true} : ${3:false} "),
	},
	-- Language Specific Snippets
	tex = tex,
	javascript = javascript,
	typescript = javascript,
}

require("luasnip/loaders/from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip/loaders/from_vscode").lazy_load()
