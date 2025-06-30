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
  autosnippet(
    { trig = ";tt", name = "Teletype", wordTrig = false },
    fmta("@t{<>}<>", { i(1, "teletype"), i(0) })
  ),
  autosnippet(
    { trig = ";beg", name = "Environment" },
    fmta([[
      @<>
      <>
      @end <>
    ]], {
      i(1),
      i(0),
      rep(1),
    })
  ),
  autosnippet(
    { trig = ";ex", name = "Example" },
    fmta([[
      @example <>
      <>
      @end example
    ]], {
      i(1, "lang"),
      i(0),
    })
  ),
  autosnippet(
    { trig = ";fn", name = "Footnote", wordTrig = false },
    fmta("@footnote{<>}<>", { i(1, "footnote"), i(0) })
  ),
  autosnippet(
    { trig = ";src", name = "Example block" },
    fmta([[
      @example <>
      <>
      @end example
    ]], {
      i(1, "lang"),
      i(0),
    })
  ),
}

local snippets = {
  s(
    { trig = "ch", name = "Chapter" },
    fmta([[
      @node <>
      @chapter <>
    ]], {
      i(1),
      rep(1),
    })
  ),
  s(
    { trig = "sec", name = "Section" },
    fmta([[
      @node <>
      @section <>
    ]], {
      i(1),
      rep(1),
    })
  ),
  s(
    { trig = "subsec", name = "Subsection" },
    fmta([[
      @node <>
      @subsection <>
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
    fmta("@b{<>}<>", { i(1, "bold"), i(0) })
  ),
  s(
    { trig = "lst", name = "Itemize List" },
    fmta([[
      @itemize
      <>
      @end itemize
    ]], {
      i(0),
    })
  ),
  s(
    { trig = "nlst", name = "Enumerate List" },
    fmta([[
      @enumerate
      <>
      @end enumerate
    ]], {
      i(0),
    })
  ),
  s(
    { trig = "-", name = "List item" },
    fmta([[
      @item
      <>
    ]], {
      i(0),
    })
  ),
}

return require('utils.tables').concatenate_sequential_tables(autosnippets, snippets)
