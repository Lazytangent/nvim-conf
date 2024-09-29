local generate_matrix = function(args, snip)
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

local function math()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local function get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
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
    { condition = math }
  ),
}

local other_snippets = {
  -- SUPERSCRIPT
  -- quote triggers superscript
  s({trig = "([%w%)%]%}])'", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = math}
  ),
  -- SUBSCRIPT
  -- semicolon triggers subscript
  s({trig = "([%w%)%]%}]);", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = math}
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  -- dunderscore trigger
  s({trig = "([%w%)%]%}])__", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = math}
  ),
  -- TEXT SUBSCRIPT
  s({trig = 'sd', snippetType="autosnippet", wordTrig=false},
    fmta("_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    {condition = math}
  ),
  -- SUPERSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a superscript.
  s({trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return snip.captures[2] end ),
      }
    ),
    {condition = math}
  ),
  -- SUBSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a subscript.
  s({trig = '([%w%)%]%}]):([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        f( function(_, snip) return snip.captures[2] end ),
      }
    ),
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
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
    {condition = math}
  ),
  -- INTEGRAL from positive to negative infinity
  s({trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{\\infty}^{\\infty}",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = math}
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
    {condition = math}
  ),
  --
  -- BEGIN STATIC SNIPPETS
  --

  -- DIFFERENTIAL, i.e. \diff
  s({trig = "df", snippetType="autosnippet", priority=2000},
    {
      t("\\diff"),
    },
    {condition = math}
  ),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({trig = "in1", snippetType="autosnippet"},
    {
      t("\\int"),
    },
    {condition = math}
  ),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({trig = "in2", snippetType="autosnippet"},
    {
      t("\\iint"),
    },
    {condition = math}
  ),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({trig = "in3", snippetType="autosnippet"},
    {
      t("\\iiint"),
    },
    {condition = math}
  ),
  -- CLOSED SINGLE INTEGRAL, i.e. \oint
  s({trig = "oi1", snippetType="autosnippet"},
    {
      t("\\oint"),
    },
    {condition = math}
  ),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({trig = "oi2", snippetType="autosnippet"},
    {
      t("\\oiint"),
    },
    {condition = math}
  ),
  -- GRADIENT OPERATOR, i.e. \grad
  s({trig = "gdd", snippetType="autosnippet"},
    {
      t("\\grad "),
    },
    {condition = math}
  ),
  -- CURL OPERATOR, i.e. \curl
  s({trig = "cll", snippetType="autosnippet"},
    {
      t("\\curl "),
    },
    {condition = math}
  ),
  -- DIVERGENCE OPERATOR, i.e. \divergence
  s({trig = "DI", snippetType="autosnippet"},
    {
      t("\\div "),
    },
    {condition = math}
  ),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({trig = "laa", snippetType="autosnippet"},
    {
      t("\\laplacian "),
    },
    {condition = math}
  ),
  -- PARALLEL SYMBOL, i.e. \parallel
  s({trig = "||", snippetType="autosnippet"},
    {
      t("\\parallel"),
    }
  ),
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
    {condition = math}
  ),
  -- PROPTO, i.e. \propto
  s({trig = "pt", snippetType="autosnippet"},
    {
      t("\\propto "),
    },
    {condition = math}
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
}

return vim.list_extend(snippets, other_snippets)
