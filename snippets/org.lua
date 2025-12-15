local utils = require('utils.ts')

local function get_previous_src_lang()
  local lang = 'org'
  local query_strs = { '((block parameter: (expr) @lang))' }

  local res = utils.find_match(lang, query_strs)
  return res or 'lang'
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
  s({ trig = ";beg", dscr = "#+BEGIN_$1", name = "Create environment", snippetType = "autosnippet" },
    fmt(
      [[
      #+begin_{}
      {}
      #+end_{}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),
  s({ trig = ";eq*", description = "equation*", name = "LaTeX Equation* Environment", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{equation*}
      <>
      \end{equation*}
      ]],
      { i(0) }
    )
  ),
  s({ trig = ";tex", description = "LaTeX Environment", name = "LaTeX Environment", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
      <>
      \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),
  s({ trig = ";tt", snippetType = "autosnippet" }, fmt("={}={}", { i(1, "code content"), i(0) })),
  s({ trig = ";bf", snippetType = "autosnippet" },
    fmt("*{}*{}", { i(1, "bold"), i(0) })
  ),
  s({ trig = ";it", snippetType = "autosnippet" },
    fmt("/{}/{}", { i(1, "italics"), i(0) })
  ),
  s({ trig = ";m", wordTrig = false, snippetType = "autosnippet" },
    fmt("${}${}", { i(1, "math mode"), i(0) })
  ),
  s({ trig = "<s" },
    fmta(
      [[
      #+begin_src <>
      <>
      #+end_src
      ]],
      {
        d(1, function()
          local lang = get_previous_src_lang()
          return sn(nil, { i(1, lang) })
        end),
        i(0)
      }
    )
  ),
  s(
    { trig = "gid", dscr = "Org Roam ID", name = "Org Roam ID" },
    fmta(
      [[
      :properties:
      :id: <>
      :end:
      ]],
      {
        f(function()
          local id = require('orgmode.org.id').new()
          print('id is', id)
          return id
        end)
      }
    )
  ),
  s(
    { trig = "<v" },
    fmta([[
    #+begin_verse
    <>
    #+end_verse
    ]], {
      i(0),
    })
  ),
}

return orgmode
