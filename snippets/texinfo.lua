local snippets = {
  autosnippet(
    { trig = ";latex", name = "LaTeX", dscr = "Special LaTeX command", wordTrig = false },
    { t "@LaTeX{}" }
  ),
  autosnippet(
    { trig = ";tex", name = "TeX", dscr = "Special TeX command", wordTrig = false },
    { t "@TeX{}" }
  ),
  s(
    { trig = ";ch", name = "Chapter" },
    fmta([[
      @node <>
      @chapter <>
    ]], {
      i(1),
      rep(1),
    })
  ),
  s(
    { trig = ";sec", name = "Section" },
    fmta([[
      @node <>
      @section <>
    ]], {
      i(1),
      rep(1),
    })
  ),
}

return snippets
