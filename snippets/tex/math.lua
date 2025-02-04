local generate_matrix = function(_, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    if ins_indx ~= 1 then
      table.insert(nodes, t({ "\\\\", "" }))
    end
    table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t(" & "))
      table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
  end
  return sn(nil, nodes)
end

local snippets = {
  s({
      trig = "([%sbBpvV])Mat(%d+)x(%d+)",
      regTrig = true,
      wordTrig = false,
      dscr = "[bBpvV]matrix of A x B size",
    },
    fmta([[
      \begin{<>}
      <>
      \end{<>}]],
      {
        f(function(_, snip)
          if snip.captures[1] == " " then
            return "matrix"
          else
            return snip.captures[1] .. "matrix"
          end
        end),
        d(1, generate_matrix),
        f(function(_, snip)
          if snip.captures[1] == " " then
            return "matrix"
          else
            return snip.captures[1] .. "matrix"
          end
        end)
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet({ trig = "//", name = "fraction" },
    fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(0) }),
    { condition = tex.in_math }
  ),
}

local other_snippets = {
  autosnippet({ trig = "||", name = "double bars", wordTrig = false },
    fmta("\\|<>", { i(0) }),
    { condition = tex.in_math }
  ),
  autosnippet({ trig = "([%w]+)mg", wordTrig = false, regTrig = true },
    fmta(
      "\\|<>\\|<>",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(0),
      }
    ),
    {
      condition = tex.in_math,
    }
  ),
  -- SUPERSCRIPT
  -- quote triggers superscript
  s({trig = "([%w%)%]%}%|])'", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- SUBSCRIPT
  -- semicolon triggers subscript
  s({trig = "([%w%)%]%}%|]);", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  -- dunderscore trigger
  s({trig = "([%w%)%]%}%|])__", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_math}
  ),
  -- TEXT SUBSCRIPT
  s({trig = 'sd', snippetType="autosnippet", wordTrig=false},
    fmta("_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    {condition = tex.in_math}
  ),
  -- SUPERSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a superscript.
  s({trig = '([%w%)%]%}%|])"([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return snip.captures[2] end ),
      }
    ),
    {condition = tex.in_math}
  ),
  -- SUBSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a subscript.
  s({trig = '([%w%)%]%}%|]):([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return snip.captures[2] end ),
      }
    ),
    {condition = tex.in_math}
  ),
  -- EULER'S NUMBER SUPERSCRIPT SHORTCUT
  s({trig = '([^%a])ee', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>e^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
      }
    ),
    {condition = tex.in_math}
  ),
  -- ZERO SUBSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("0")
      }
    ),
    {condition = tex.in_math}
  ),
  -- MINUS ONE SUPERSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])11', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("-1")
      }
    ),
    {condition = tex.in_math}
  ),
  -- J SUBSCRIPT SHORTCUT (since jk triggers snippet jump forward)
  s({trig = '([%a%)%]%}])JJ', wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("j")
      }
    ),
    {condition = tex.in_math}
  ),
  -- PLUS SUPERSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])%+%+', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("+")
      }
    ),
    {condition = tex.in_math}
  ),
  -- COMPLEMENT SUPERSCRIPT
  s({trig = '([%a%)%]%}])CC', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("\\complement")
      }
    ),
    {condition = tex.in_math}
  ),
  -- CONJUGATE (STAR) SUPERSCRIPT SHORTCUT
  s({trig = '([%a%)%]%}])%*%*', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        t("*")
      }
    ),
    {condition = tex.in_math}
  ),
  -- VECTOR, i.e. \vec
  s({trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\vec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- DEFAULT UNIT VECTOR WITH SUBSCRIPT, i.e. \unitvector_{}
  s({trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\unitvector_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- UNIT VECTOR WITH HAT, i.e. \uvec{}
  s({trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\uvec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- MATRIX, i.e. \vec
  s({trig = "([^%a])mt", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\mat{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- FRACTION
  s({trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\frac{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
        i(2),
      }
    ),
    {condition = tex.in_math}
  ),
  -- ANGLE
  s({trig = "([^%a])gg", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\ang{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- ABSOLUTE VALUE
  s({trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\abs{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- SQUARE ROOT
  s({trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sqrt{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- BINOMIAL SYMBOL
  s({trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\binom{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_math}
  ),
  -- LOGARITHM WITH BASE SUBSCRIPT
  s({trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\log_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_math}
  ),
  -- DERIVATIVE with denominator only
  s({trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\dvOne{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- DERIVATIVE with numerator and denominator
  s({trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\dv{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_math}
  ),
  -- DERIVATIVE with numerator, denominator, and higher-order argument
  s({trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\dvN{<>}{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
        i(3),
      }
    ),
    {condition = tex.in_math}
  ),
  -- PARTIAL DERIVATIVE with denominator only
  s({trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\pdvOne{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_math}
  ),
  -- PARTIAL DERIVATIVE with numerator and denominator
  s({trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\pdv{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_math}
  ),
  -- PARTIAL DERIVATIVE with numerator, denominator, and higher-order argument
  s({trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\pdvN{<>}{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
        i(3),
      }
    ),
    {condition = tex.in_math}
  ),
  -- SUM with lower limit
  s({trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_math}
  ),
  -- SUM with upper and lower limit
  s({trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_math}
  ),
  -- INTEGRAL with upper and lower limit
  s({trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_math}
  ),
  -- INTEGRAL from positive to negative infinity
  s({trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{\\infty}^{\\infty}",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_math}
  ),
  -- BOXED command
  s({trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\boxed{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
      }
    ),
    {condition = tex.in_math}
  ),
  --
  -- BEGIN STATIC SNIPPETS
  --

  -- DIFFERENTIAL, i.e. \diff
  s({trig = "df", snippetType="autosnippet", priority=2000},
    {
      t("\\diff"),
    },
    {condition = tex.in_math}
  ),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({trig = "in1", snippetType="autosnippet"},
    {
      t("\\int"),
    },
    {condition = tex.in_math}
  ),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({trig = "in2", snippetType="autosnippet"},
    {
      t("\\iint"),
    },
    {condition = tex.in_math}
  ),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({trig = "in3", snippetType="autosnippet"},
    {
      t("\\iiint"),
    },
    {condition = tex.in_math}
  ),
  -- CLOSED SINGLE INTEGRAL, i.e. \oint
  s({trig = "oi1", snippetType="autosnippet"},
    {
      t("\\oint"),
    },
    {condition = tex.in_math}
  ),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({trig = "oi2", snippetType="autosnippet"},
    {
      t("\\oiint"),
    },
    {condition = tex.in_math}
  ),
  -- GRADIENT OPERATOR, i.e. \grad
  s({trig = "gdd", snippetType="autosnippet"},
    {
      t("\\grad "),
    },
    {condition = tex.in_math}
  ),
  -- CURL OPERATOR, i.e. \curl
  s({trig = "cll", snippetType="autosnippet"},
    {
      t("\\curl "),
    },
    {condition = tex.in_math}
  ),
  -- DIVERGENCE OPERATOR, i.e. \divergence
  s({trig = "DI", snippetType="autosnippet"},
    {
      t("\\div "),
    },
    {condition = tex.in_math}
  ),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({trig = "laa", snippetType="autosnippet"},
    {
      t("\\laplacian "),
    },
    {condition = tex.in_math}
  ),
  -- PARALLEL SYMBOL, i.e. \parallel
  -- s({trig = "||", snippetType="autosnippet"},
  --   {
  --     t("\\parallel"),
  --   }
  -- ),
  -- CDOTS, i.e. \cdots
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdots"),
    }
  ),
  -- LDOTS, i.e. \ldots
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),
  -- EQUIV, i.e. \equiv
  s({trig = "eqq", snippetType="autosnippet"},
    {
      t("\\equiv "),
    }
  ),
  -- SETMINUS, i.e. \setminus
  s({trig = "stm", snippetType="autosnippet"},
    {
      t("\\setminus "),
    }
  ),
  -- SUBSET, i.e. \subset
  s({trig = "sbb", snippetType="autosnippet"},
    {
      t("\\subset "),
    }
  ),
  -- APPROX, i.e. \approx
  s({trig = "px", snippetType="autosnippet"},
    {
      t("\\approx "),
    },
    {condition = tex.in_math}
  ),
  -- PROPTO, i.e. \propto
  s({trig = "pt", snippetType="autosnippet"},
    {
      t("\\propto "),
    },
    {condition = tex.in_math}
  ),
  -- COLON, i.e. \colon
  -- s({trig = "::", snippetType="autosnippet"},
  --   {
  --     t("\\colon "),
  --   }
  -- ),
  -- IMPLIES, i.e. \implies
  s({trig = ">>", snippetType="autosnippet"},
    {
      t("\\implies "),
    }
  ),
  -- DOT PRODUCT, i.e. \cdot
  s({trig = ",.", snippetType="autosnippet"},
    {
      t("\\cdot "),
    }
  ),
  -- CROSS PRODUCT, i.e. \times
  s({trig = "xx", snippetType="autosnippet"},
    {
      t("\\times "),
    }
  ),

  s({trig = "bf"},
    fmta("\\mathbf{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "rm"},
    fmta("\\mathrm{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "sf"},
    fmta("\\mathsf{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "it"},
    fmta("\\mathit{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "cal"},
    fmta("\\mathcal{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "bb"},
    fmta("\\mathbb{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "frak"},
    fmta("\\mathfrak{<>}<>", { i(1, "bold"), i(0) }),
    {condition = tex.in_math}
  ),

  -- Floor
  s({trig = "lf"},
    fmta("\\lfloor <>", { i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "rf"},
    fmta("\\rfloor <>", { i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "floor"},
    fmta("\\lfloor <> \\rfloor<>", { i(1, "floor"), i(0) }),
    {condition = tex.in_math}
  ),

  -- Ceilings
  s({trig = "lc"},
    fmta("\\lceil <>", { i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "rc"},
    fmta("\\rceil <>", { i(0) }),
    {condition = tex.in_math}
  ),
  s({trig = "ceil"},
    fmta("\\lceil <> \\rceil<>", { i(1, "ceil"), i(0) }),
    {condition = tex.in_math}
  ),

  -- O(n)
  s({trig = "oo"},
    fmta("$O(<>)$<>", { i(1, "n"), i(0) })
  ),
}

return vim.list_extend(snippets, other_snippets)
