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

local latex = {
  s({ trig = "beg", namr = "begin{} / end{}", dscr = "Create environment" },
    fmta(
      [[
      \begin{<>}
      <>
      \end{<>}
      ]],
      { i(1), i(0), f(copy, 1) }
    )
  ),
  s("ldots", {
    t "\\ldots",
  }),
  s("...", {
    t "\\dots",
  }),
  s({ trig = "fig", namr = "Figure environment", dscr = "Figure environment" },
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
  s({ trig = "table", namr = "Table environment", dscr = "Table environment" }, {
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
  s({ trig = "pac", dscr = "Package" }, {
    t "\\usepackage[",
    i(1, "options"),
    t "]{",
    i(2, "package"),
    t "}",
    i(0),
  }),
  s({ trig = "iff", dscr = "iff" }, {
    t "\\iff",
  }),
  s({ trig = "sum", dscr = "sum" }, {
    t "\\sum_{n=",
    i(1, "1"),
    t "}^{",
    i(2, "\\infty"),
    t "} ",
    i(3, "a_n z^n"),
    t "}",
  }),
  s({ trig = "sqrt", dscr = "\\sqrt{}" }, {
    t "\\sqrt{",
    i(1),
    t "}",
    i(0),
  }),
  s({ trig = "sq", dscr = "\\sqrt{}" }, {
    t "\\sqrt{",
    i(1),
    t "}",
    i(0),
  }),
  s({ trig = "eq", dscr = "Create equation environment" }, {
    t { "\\begin{equation}", "\t" },
    i(0),
    t { "", "\\end{equation}" },
  }),
  s({ trig = "eq*", dscr = "Create anonymous equation environment" }, {
    t { "\\begin{equation*}", "\t" },
    i(0),
    t { "", "\\end{equation*}" },
  }),
  s({ trig = "nabla", dscr = "Insert Nabla symbol" }, {
    t "\\nabla",
    i(0),
  }),
  s({ trig = "upsidedowndelta", dscr = "Insert Nabla symbol" }, {
    t "\\nabla",
    i(0),
  }),
  s({ trig = "verb", dscr = "Inline verbatim", name = "\\verb||" }, {
    t("\\verb|"),
    i(1),
    t("|"),
    i(0),
  }),
  s({ trig = "sub*", dscr = "Un-numbered subsection", name = "\\subsection*" }, {
    t("\\subsection*{"),
    i(1, "subsection"),
    t("}"),
    i(0),
  }),
  s({ trig = "sim", dscr = "Similar/Tilde", name = "Regular sim" }, {
    t("\\sim"),
    i(0),
  }),
  s({ trig = "emph", dscr = "\\emph{$1}$0", name = "Emphasis" }, {
    t("\\emph{"),
    i(1),
    t("}"),
    i(0),
  }),
  s({ trig = "italic", dscr = "\\emph{$1}$0", name = "Emphasis" }, {
    t("\\emph{"),
    i(1),
    t("}"),
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
  s({ trig = "ddx", dscr = "Derivative notation", name = "Derivative" }, {
    t("\\frac{d}{dx}"),
    i(0),
  }),
  s("degree", { t("^{\\circ}"), i(0) }),
  s("mm", fmt("${}${}", { i(1, "math mode"), i(0) })),
  s("//", fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(0) })),
}
return latex
