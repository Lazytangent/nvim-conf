local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local function copy(args)
  return args[1]
end

local greek = require('extensions.snippets.greek')

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
}

vim.list_extend(orgmode, greek)
return orgmode
