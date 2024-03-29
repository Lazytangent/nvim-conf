local function copy(args)
  return args[1]
end

local orgmode = {
  s({ trig = "__", dscr = "#+TITLE: ", name = "Create title" }, {
    t("#+title: "),
    i(1, "title"),
  }),
  s({ trig = "title", dscr = "#+TITLE: ", name = "Create title" }, {
    t("#+title: "),
    i(1, "title"),
  }),
  s({ trig = "beg", dscr = "#+BEGIN_$1", name = "Create environment" },
    fmt(
      [[
      #+begin_{}
      {}
      #+end_{}
      ]],
      { i(1), i(0), f(copy, 1) }
    )
  ),
  s({ trig = "eq*", description = "equation*", name = "LaTeX Equation* Environment" },
    fmta(
      [[
      \begin{equation*}
      <>
      \end{equation*}
      ]],
      { i(0) }
    )
  ),
  s({ trig = "env", description = "LaTeX Environment", name = "LaTeX Environment" },
    fmta(
      [[
      \begin{<>}
      <>
      \end{<>}
      ]],
      { i(1), i(0), f(copy, 1) }
    )
  ),
  s("ee", fmt("={}={}", { i(1, "code content"), i(0) })),
  s("tt", fmt("~{}~{}", { i(1, "code content"), i(0) })),
}

return orgmode
