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

local function dynamic_get_select(args)
	local f_node = f(function(args) return args[1].env.SELECT_RAW end, {})
	local node = i(1, f_node)
	local snip = sn(nil, node)
	return snip
end

local greek = require('plugins.snippets.greek')

local latex = {
	s({ trig = "beg", namr = "begin{} / end{}", dscr = "Create environment" }, {
		t("\\begin{"),
		i(1),
		t({ "}", "\t" }),
		i(0),
		t({ "", "\\end{" }),
		f(copy, 1),
		t({ "}" }),
	}),
	s("ldots", {
		t("\\ldots"),
	}),
	s({ trig = "fig", namr = "Figure environment", dscr = "Figure environment" }, {
		t("\\begin{figure}["),
		i(1, "htpb"),
		t({ "]", "\t\\centering", "" }),
		i(2, "\t\\includegraphics[width=0.8\\textwidth]{"),
		i(3),
		t({ "}", "\t\\caption{" }),
		d(4, dynamic_copy, { 3 }, 3),
		t({ "}", "\t\\label{fig:" }),
		d(5, dynamic_copy, { 3 }, 3),
		t({ "}", "\\end{figure}" }),
	}),
	s({ trig = "table", namr = "Table environment", dscr = "Table environment" }, {
		t("\\begin{table}["),
		i(1, "htpb"),
		t({ "]", "" }),
		t({ "\t\\centering", "" }),
		t("\t\\caption{"),
		i(2, "caption"),
		t({ "}", "" }),
		t("\t\\label{tab:"),
		i(3, "label"),
		t({ "}", "" }),
		t("\t\\begin{tabular}{"),
		i(4, "c"),
		t({ "}", "" }),
		i(0),
		t({ "", "\t\\end{tabular}", "\\end{table}" }),
	}),
	s({ trig = "pac", dscr = "Package" }, {
		t("\\usepackage["),
		i(1, "options"),
		t("]{"),
		i(2, "package"),
		t("}"),
		i(0)
	}),
	s({ trig = "iff", dscr = "iff" }, {
		t("\\iff"),
	}),
	s({ trig = "sum", dscr = "sum" }, {
		t("\\sum_{n="),
		i(1, "1"),
		t("}^{"),
		i(2, "\\infty"),
		t("} "),
		i(3, "a_n z^n"),
		t("}"),
	}),
	s({ trig = "sq", dscr = "\\sqrt{}" }, {
		t("\\sqrt{"),
		i(1),
		t("}"),
		i(0),
	}),
	s({ trig = "equation", dscr = "Create equation environment" }, {
		t({ "\\begin{equation}", "" }),
		i(0),
		t({ "", "\\end{equation}" }),
	}),
	s({ trig = "equation*", dscr = "Create anonymous equation environment" }, {
		t({ "\\begin{equation*}", "" }),
		i(0),
		t({ "", "\\end{equation*}" }),
	}),
}

vim.list_extend(latex, greek)
return latex
