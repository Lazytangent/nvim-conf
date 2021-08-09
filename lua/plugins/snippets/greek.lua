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

return {
	s({ trig = "alpha", dscr = "Lowercase Greek alpha character" }, {
		t("\\alpha"),
		i(0),
	}),
	s({ trig = "beta", dscr = "Lowercase Greek beta character" }, {
		t("\\beta"),
		i(0),
	}),
	s({ trig = "gamma", dscr = "Lowercase Greek gamma character" }, {
		t("\\gamma"),
		i(0),
	}),
	s({ trig = "Gamma", dscr = "Uppercase Greek Gamma character" }, {
		t("\\Gamma"),
		i(0),
	}),
	s({ trig = "delta", dscr = "Lowercase Greek delta character" }, {
		t("\\delta"),
		i(0),
	}),
	s({ trig = "Delta", dscr = "Lowercase Greek Delta character" }, {
		t("\\Delta"),
		i(0),
	}),
	s({ trig = "epsilon", dscr = "Lowercase Greek epsilon character" }, {
		t("\\epsilon"),
		i(0),
	}),
	s({ trig = "Epsilon", dscr = "Uppercase Greek Epsilon character" }, {
		t("\\Epsilon"),
		i(0),
	}),
	s({ trig = "varepsilon", dscr = "Lowercase Greek varepsilon character" }, {
		t("\\varepsilon"),
		i(0),
	}),
	s({ trig = "zeta", dscr = "Lowercase Greek zeta character" }, {
		t("\\zeta"),
		i(0),
	}),
	s({ trig = "eta", dscr = "Lowercase Greek eta character" }, {
		t("\\eta"),
		i(0),
	}),
	s({ trig = "theta", dscr = "Lowercase Greek theta character" }, {
		t("\\theta"),
		i(0),
	}),
	s({ trig = "vartheta", dscr = "Lowercase Greek vartheta character" }, {
		t("\\vartheta"),
		i(0),
	}),
	s({ trig = "Theta", dscr = "Uppercase Greek Theta character" }, {
		t("\\Theta"),
		i(0),
	}),
	s({ trig = "iota", dscr = "Lowercase Greek iota character" }, {
		t("\\iota"),
		i(0),
	}),
	s({ trig = "kappa", dscr = "Lowercase Greek kappa character" }, {
		t("\\kappa"),
		i(0),
	}),
	s({ trig = "lambda", dscr = "Lowercase Greek lambda character" }, {
		t("\\lambda"),
		i(0),
	}),
	s({ trig = "Lambda", dscr = "Uppercase Greek Lambda character" }, {
		t("\\Lambda"),
		i(0),
	}),
	s({ trig = "mu", dscr = "Lowercase Greek mu character" }, {
		t("\\mu"),
		i(0),
	}),
	s({ trig = "nu", dscr = "Lowercase Greek nu character" }, {
		t("\\nu"),
		i(0),
	}),
	s({ trig = "xi", dscr = "Lowercase Greek xi character" }, {
		t("\\xi"),
		i(0),
	}),
	s({ trig = "Xi", dscr = "Uppercase Greek Xi character" }, {
		t("\\Xi"),
		i(0),
	}),
	s({ trig = "pi", dscr = "Lowercase Greek pi character" }, {
		t("\\pi"),
		i(0),
	}),
	s({ trig = "Pi", dscr = "Uppercase Greek Pi character" }, {
		t("\\Pi"),
		i(0),
	}),
	s({ trig = "rho", dscr = "Lowercase Greek rho character" }, {
		t("\\rho"),
		i(0),
	}),
	s({ trig = "varrho", dscr = "Lowercase Greek varrho character" }, {
		t("\\varrho"),
		i(0),
	}),
	s({ trig = "sigma", dscr = "Lowercase Greek sigma character" }, {
		t("\\sigma"),
		i(0),
	}),
	s({ trig = "Sigma", dscr = "Uppercase Greek Sigma character" }, {
		t("\\Sigma"),
		i(0),
	}),
	s({ trig = "tau", dscr = "Lowercase Greek tau character" }, {
		t("\\tau"),
		i(0),
	}),
	s({ trig = "upsilon", dscr = "Lowercase Greek upsilon character" }, {
		t("\\upsilon"),
		i(0),
	}),
	s({ trig = "Upsilon", dscr = "Uppercase Greek Upsilon character" }, {
		t("\\Upsilon"),
		i(0),
	}),
	s({ trig = "phi", dscr = "Lowercase Greek phi character" }, {
		t("\\phi"),
		i(0),
	}),
	s({ trig = "varphi", dscr = "Lowercase Greek varphi character" }, {
		t("\\varphi"),
		i(0),
	}),
	s({ trig = "Phi", dscr = "Uppercase Greek Phi character" }, {
		t("\\Phi"),
		i(0),
	}),
	s({ trig = "chi", dscr = "Lowercase Greek chi character" }, {
		t("\\chi"),
		i(0),
	}),
	s({ trig = "psi", dscr = "Lowercase Greek psi character" }, {
		t("\\psi"),
		i(0),
	}),
	s({ trig = "Psi", dscr = "Uppercase Greek Psi character" }, {
		t("\\Psi"),
		i(0),
	}),
	s({ trig = "omega", dscr = "Lowercase Greek omega character" }, {
		t("\\omega"),
		i(0),
	}),
	s({ trig = "Omega", dscr = "Uppercase Greek Omega character" }, {
		t("\\Omega"),
		i(0),
	}),
}
