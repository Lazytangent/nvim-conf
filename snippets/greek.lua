local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({ trig = "a.", dscr = "Lowercase Greek alpha character" }, {
    t "\\alpha",
    i(0),
  }),
  s({ trig = "b.", dscr = "Lowercase Greek beta character" }, {
    t "\\beta",
    i(0),
  }),
  s({ trig = "g.", dscr = "Lowercase Greek gamma character" }, {
    t "\\gamma",
    i(0),
  }),
  s({ trig = "G.", dscr = "Uppercase Greek Gamma character" }, {
    t "\\Gamma",
    i(0),
  }),
  s({ trig = "d.", dscr = "Lowercase Greek delta character" }, {
    t "\\delta",
    i(0),
  }),
  s({ trig = "D.", dscr = "Lowercase Greek Delta character" }, {
    t "\\Delta",
    i(0),
  }),
  s({ trig = "e.", dscr = "Lowercase Greek epsilon character" }, {
    t "\\epsilon",
    i(0),
  }),
  s({ trig = "E.", dscr = "Uppercase Greek Epsilon character" }, {
    t "\\Epsilon",
    i(0),
  }),
  s({ trig = "e,", dscr = "Lowercase Greek varepsilon character" }, {
    t "\\varepsilon",
    i(0),
  }),
  s({ trig = "z.", dscr = "Lowercase Greek zeta character" }, {
    t "\\zeta",
    i(0),
  }),
  s({ trig = "h.", dscr = "Lowercase Greek eta character" }, {
    t "\\eta",
    i(0),
  }),
  s({ trig = "th.", dscr = "Lowercase Greek theta character" }, {
    t "\\theta",
    i(0),
  }),
  s({ trig = "th,", dscr = "Lowercase Greek vartheta character" }, {
    t "\\vartheta",
    i(0),
  }),
  s({ trig = "Th.", dscr = "Uppercase Greek Theta character" }, {
    t "\\Theta",
    i(0),
  }),
  s({ trig = "i.", dscr = "Lowercase Greek iota character" }, {
    t "\\iota",
    i(0),
  }),
  s({ trig = "k.", dscr = "Lowercase Greek kappa character" }, {
    t "\\kappa",
    i(0),
  }),
  s({ trig = "l.", dscr = "Lowercase Greek lambda character" }, {
    t "\\lambda",
    i(0),
  }),
  s({ trig = "L.", dscr = "Uppercase Greek Lambda character" }, {
    t "\\Lambda",
    i(0),
  }),
  s({ trig = "m.", dscr = "Lowercase Greek mu character" }, {
    t "\\mu",
    i(0),
  }),
  s({ trig = "n.", dscr = "Lowercase Greek nu character" }, {
    t "\\nu",
    i(0),
  }),
  s({ trig = "x.", dscr = "Lowercase Greek xi character" }, {
    t "\\xi",
    i(0),
  }),
  s({ trig = "X.", dscr = "Uppercase Greek Xi character" }, {
    t "\\Xi",
    i(0),
  }),
  s({ trig = "p.", dscr = "Lowercase Greek pi character" }, {
    t "\\pi",
    i(0),
  }),
  s({ trig = "P.", dscr = "Uppercase Greek Pi character" }, {
    t "\\Pi",
    i(0),
  }),
  s({ trig = "r.", dscr = "Lowercase Greek rho character" }, {
    t "\\rho",
    i(0),
  }),
  s({ trig = "r,", dscr = "Lowercase Greek varrho character" }, {
    t "\\varrho",
    i(0),
  }),
  s({ trig = "s.", dscr = "Lowercase Greek sigma character" }, {
    t "\\sigma",
    i(0),
  }),
  s({ trig = "S.", dscr = "Uppercase Greek Sigma character" }, {
    t "\\Sigma",
    i(0),
  }),
  s({ trig = "t.", dscr = "Lowercase Greek tau character" }, {
    t "\\tau",
    i(0),
  }),
  s({ trig = "u.", dscr = "Lowercase Greek upsilon character" }, {
    t "\\upsilon",
    i(0),
  }),
  s({ trig = "U.", dscr = "Uppercase Greek Upsilon character" }, {
    t "\\Upsilon",
    i(0),
  }),
  s({ trig = "ph.", dscr = "Lowercase Greek phi character" }, {
    t "\\phi",
    i(0),
  }),
  s({ trig = "ph,", dscr = "Lowercase Greek varphi character" }, {
    t "\\varphi",
    i(0),
  }),
  s({ trig = "Ph.", dscr = "Uppercase Greek Phi character" }, {
    t "\\Phi",
    i(0),
  }),
  s({ trig = "c.", dscr = "Lowercase Greek chi character" }, {
    t "\\chi",
    i(0),
  }),
  s({ trig = "ps.", dscr = "Lowercase Greek psi character" }, {
    t "\\psi",
    i(0),
  }),
  s({ trig = "Ps.", dscr = "Uppercase Greek Psi character" }, {
    t "\\Psi",
    i(0),
  }),
  s({ trig = "o.", dscr = "Lowercase Greek omega character" }, {
    t "\\omega",
    i(0),
  }),
  s({ trig = "O.", dscr = "Uppercase Greek Omega character" }, {
    t "\\Omega",
    i(0),
  }),
}
