local ls = require('luasnip')
local utils = require('utils.ts')

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

local function get_previous_minted_lang()
  local lang = 'latex'
  local query_strs = {
    [[(minted_environment
          (begin
            (curly_group_text
              (text
                (word)))
            (curly_group_text
              (text
                (word) @lang))))]],
  }

  local res = utils.find_match(lang, query_strs)

  return res or 'lang'
end

local latex = {
  autosnippet({ trig = ";latex", name = "LaTeX", dscr = "Special LaTeX command", wordTrig = false },
    { t "\\LaTeX{}" }
  ),
  autosnippet({ trig = ";tex", name = "TeX", dscr = "Special TeX command", wordTrig = false },
    { t "\\TeX{}", }
  ),
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
  s({ trig = "vbm", name = "Verbatim environment", dscr = "Verbatim environment" },
    fmta([[
    \begin{verbatim}
    <>
    \end{verbatim}<>
    ]], {
      i(1),
      i(0),
    })
  ),
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
  s({ trig = 'nln', dscr = "mintinline" },
    fmta("\\mintinline{<>}{<>}<>", {
      d(2, function()
        local lang = get_previous_minted_lang()
        return sn(nil, { i(1, lang) })
      end),
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
        d(1, function()
          local lang = get_previous_minted_lang()
          return sn(nil, { i(1, lang) })
        end),
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
        d(2, function()
          local lang = get_previous_minted_lang()
          return sn(nil, { i(1, lang) })
        end),
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
        d(2, function()
          local lang = get_previous_minted_lang()
          return sn(nil, { i(1, lang) })
        end),
        i(3, "code"),
        i(0),
      })
  ),
  s({ trig = 'fnm', dscr = 'Footnote mark' },
    fmta("\\footnotemark[<>]<>", {
      i(1, "num"),
      i(0),
    })
  ),
  s({ trig = 'fnt', dscr = 'Footnote text' },
    fmta("\\footnotetext[<>]{<>}<>", {
      i(1, "num"),
      i(2, "text"),
      i(0)
    })
  ),
  s({ trig = "-", dscr = "Item" }, c(1, {
    fmta("\\item{<>}<>", { i(1), i(0) }),
    fmta("\\item[<>]{<>}<>", { i(1), i(2), i(3) }),
  })),
}

return latex
