local autosnippets = {
  autosnippet(
    { trig = ";__", name = "Skeleton", dscr = "Create basic TeXinfo skeleton" },
    fmta([[
    \input texinfo
    @setfilename <>.info
    @settitle <>
    @documentencoding UTF-8

    @titlepage
    @end titlepage

    @contents

    @node Top
    @top <>

    <>

    @bye
    ]], {
      i(1, "manual"),
      i(2, "title"),
      i(3, "top node"),
      i(0),
    })
  ),
  autosnippet(
    { trig = ";url", name = "Url" },
    {
      c(1, {
        fmta("@url{<>}<>", { i(1, "url"), i(0) }),
        fmta("@url{<>, <>}<>", { i(1, "url"), i(2, "[displayed-text]"), i(0) }),
      })
    }
  ),
  autosnippet(
    { trig = ";key", name = "Key", dscr = "Key" },
    fmta("@key{<>}<>", { i(1), i(0) })
  ),
  autosnippet(
    { trig = ";q", name = 'Single quoted', dscr = 'Single quote something' },
    fmta("`<>'<>", { i(1), i(0) })
  ),
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
    { trig = ";tab", name = "@tab" },
    { t "@tab" }
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
    {
      c(1, {
        fmta([[
          @item
          <><>
        ]], {
          i(1),
          i(0),
        }),
        fmta([[
          @item <>
          <>
        ]], { i(1, "item"), i(0, "desc") }),
      })
    }
  ),
}

return require('utils.tables').concatenate_sequential_tables(autosnippets, snippets)
