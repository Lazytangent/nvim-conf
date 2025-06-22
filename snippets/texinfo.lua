local autosnippets = {
  autosnippet(
    { trig = ";latex", name = "LaTeX", dscr = "Special LaTeX command", wordTrig = false },
    { t "@LaTeX{}" }
  ),
  autosnippet(
    { trig = ";tex", name = "TeX", dscr = "Special TeX command", wordTrig = false },
    { t "@TeX{}" }
  ),
  autosnippet(
    { trig = ";item", name = "@item" },
    { t "@item" }
  ),
}

local snippets = {
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
  s({ trig = '"' },
    fmta("``<>''<>", { i(1), i(0) })
  ),
  s(
    { trig = "it", name = "Italics" },
    fmta("@i{<>}<>", { i(1, "italics"), i(0) })
  ),
  s(
    { trig = "bf", name = "Bold" },
    fmta("@i{<>}<>", { i(1, "bold"), i(0) })
  ),
}

return vim.tbl_extend('force', {}, autosnippets, snippets)
