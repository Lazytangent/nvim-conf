local ls = require('luasnip')

local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local function dynamic_copy(args, old_state)
  if not old_state then
    old_state = {}
  end

  local node = i(1, args[1])
  local snip = sn(nil, node)
  snip.old_state = old_state
  return snip
end

local latex = {
  autosnippet({ trig = "w/", name = "with", dscr = "Abbrevation" },
    { t "with", }
  ),
  autosnippet({ trig = "w/o", name = "without", dscr = "Abbrevation" },
    { t "without", }
  ),
  autosnippet({ trig = ";beg", name = "begin{} / end{}", dscr = "Create environment" },
    fmta(
      [[
      \begin{<>}
      <>
      \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),
  autosnippet({ trig = ";ldots", wordTrig = false }, {
    t "\\ldots",
  }),
  autosnippet({ trig = ";...", wordTrig = false }, {
    t "\\dots",
  }),
  s({ trig = "fig", name = "Figure environment", dscr = "Figure environment" },
    fmta(
    [[
    \begin{figure}[<>]
      \centering
      <><>
      \caption{<>}
      \label{<>}
    \end{figure}
    ]],
    {
      i(1, "htpb"),
      i(2, "\t\\includegraphics[width=0.8\\textwidth]{"),
      i(3),
      d(4, dynamic_copy, { 3 }, { user_args = { 3 } }),
      d(5, dynamic_copy, { 3 }, { user_args = { 3 } })
    })
  ),
  s({ trig = ";table", name = "Table environment", dscr = "Table environment", snippetType = "autosnippet" }, {
    t "\\begin{table}[",
    i(1, "htpb"),
    t { "]", "" },
    t { "\t\\centering", "" },
    t "\t\\caption{",
    i(2, "caption"),
    t { "}", "" },
    t "\t\\label{tab:",
    i(3, "label"),
    t { "}", "" },
    t "\t\\begin{tabular}{",
    i(4, "c"),
    t { "}", "" },
    i(0),
    t { "", "\t\\end{tabular}", "\\end{table}" },
  }),
  s({ trig = ";pac", dscr = "Package", wordTrig = false, snippetType = "autosnippet" }, {
    t "\\usepackage[",
    i(1, "options"),
    t "]{",
    i(2, "package"),
    t "}",
    i(0),
  }),
  s({ trig = ";iff", dscr = "iff", wordTrig = false, snippetType = "autosnippet" }, {
    t "\\iff",
  }),
  s({ trig = ";sum", dscr = "sum", wordTrig = false, snippetType = "autosnippet" }, {
    t "\\sum_{n=",
    i(1, "1"),
    t "}^{",
    i(2, "\\infty"),
    t "} ",
    i(3, "a_n z^n"),
    t "}",
  }),
  s({ trig = ";sqrt", dscr = "\\sqrt{}", wordTrig = false, snippetType = "autosnippet" }, {
    t "\\sqrt{",
    i(1),
    t "}",
    i(0),
  }),
  s({ trig = ";sq", dscr = "\\sqrt{}", wordTrig = false, snippetType = "autosnippet" }, {
    t "\\sqrt{",
    i(1),
    t "}",
    i(0),
  }),
  s({ trig = ";nabla", dscr = "Insert Nabla symbol", wordTrig = false, snippetType = "autosnippet" }, {
    t "\\nabla",
    i(0),
  }),
  s({ trig = "upsidedowndelta", dscr = "Insert Nabla symbol" }, {
    t "\\nabla",
    i(0),
  }),
  ms({
    { trig = "verb", dscr = "Inline verbatim", name = "\\verb||" },
    "vb",
    { trig = ";vb", snippetType = "autosnippet" }
  }, {
    t("\\verb|"),
    i(1),
    t("|"),
    i(0),
  }),
  s({ trig = "sim", dscr = "Similar/Tilde", name = "Regular sim" }, {
    t("\\sim"),
    i(0),
  }),
  s({ trig = "article", dscr = "Article Format", name = "Article Format" }, {
    t({"\\documentclass[12pt]{article}",
      "",
      "\\usepackage{mathtools,graphicx,amssymb,amsthm,amsmath}",
      "",
      "\\begin{document}",
      ""
    }),
    i(0),
    t({"", "\\end{document}"}),
  }),
  s({ trig = ";ddx", dscr = "Derivative notation", name = "Derivative", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\frac{d}{dx}"),
    i(0),
  }),
  s({ trig = ";deg", wordTrig = false, snippetType = "autosnippet" },
    { t("^{\\circ}"), i(0) }
  ),
  s({ trig = ";mm", wordTrig = false, snippetType = "autosnippet" },
    fmt("${}${}", { i(1, "math mode"), i(0) })
  ),
  s({ trig = ";ff", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(0) }),
    { condition = tex.in_math }
  ),
  s({ trig = ";[", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\left[<>\\right]<>", { i(1), i(0) }),
    { condition = tex.in_math }
  ),
  s({ trig = '"' },
    fmta("``<>''<>", { i(1), i(0) })
  ),
  s({ trig = ';tt', snippetType = "autosnippet" },
    fmta("\\texttt{<>}<>", { i(1, "teletype"), i(0) })
  ),
  s({ trig = 'inline', dscr = "mintinline" },
    fmta("\\mintinline{<>}{<>}<>", {
      i(2, "lang"),
      i(1),
      i(0),
    })
  ),
  s({ trig = 'lstng', dscr = 'Code listing' },
    fmta([[
      \begin{listing}[H]
      <>
      \end{listing}
      ]], {
      i(0),
    })
  ),
  s({ trig = 'mntd', dscr = 'Minted environment' },
    fmta([[
      \begin{minted}{<>}
      <>
      \end{minted}<>
      ]], {
        i(1, "lang"),
        i(2, "code"),
        i(0),
      })
  ),
  s({ trig = 'lnos', dscr = 'Minted environment with linenos' },
    fmta([[
      \begin{minted}[linenos<>]{<>}
      <>
      \end{minted}<>
      ]], {
        i(1),
        i(2, "lang"),
        i(3, "code"),
        i(0),
      })
  ),
  s({ trig = 'nmbrd', dscr = 'Minted environment with linenos starting from a firstnumber' },
    fmta([[
      \begin{minted}[linenos,firstnumber=<>]{<>}
      <>
      \end{minted}<>
      ]], {
        i(1, "linenumber"),
        i(2, "lang"),
        i(3, "code"),
        i(0),
      })
  ),
}

return latex
