local function get_previous_src_lang()
  local lang = 'org'
  local query_str = '((block parameter: (expr) @lang))'
  local query = vim.treesitter.query.parse(lang, query_str)

  local node = vim.treesitter.get_node()
  if node == nil then
    vim.notify("Node was nil")
    return ''
  end
  local tree = node:tree()
  local root_node = tree:root()
  local last = root_node

  for _, curr, _, _ in query:iter_captures(root_node, 0) do
    last = curr
  end

  local last_text = vim.treesitter.get_node_text(last, 0)
  return last_text or ''
end

local orgmode = {
  s({ trig = "__", dscr = "#+TITLE: ", name = "Create title", snippetType = "autosnippet" }, {
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
  s({ trig = ";ee", snippetType = "autosnippet" }, fmt("={}={}", { i(1, "code content"), i(0) })),
  s({ trig = ";tt", snippetType = "autosnippet" }, fmt("~{}~{}", { i(1, "code content"), i(0) })),
  s({ trig = ";bf", snippetType = "autosnippet" },
    fmt("*{}*{}", { i(1, "bold"), i(0) })
  ),
  s({ trig = ";it", snippetType = "autosnippet" },
    fmt("/{}/{}", { i(1, "italics"), i(0) })
  ),
  s({ trig = ";mm", wordTrig = false, snippetType = "autosnippet" },
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
}

return orgmode
