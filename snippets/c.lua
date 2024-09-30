local snippets = {
  autosnippet(";incs", fmt("#include <{}>{}", { i(1), i(0) })),
  autosnippet(";incl", fmt('#include "{}"{}', { i(1), i(0) })),
  autosnippet(";ifndef",
    fmt([[
      #ifndef {}
      #define {}
      {}
      #endif // !{}
    ]], {
      i(1),
      rep(1),
      i(0),
      rep(1),
    })
  ),
  autosnippet(";def", fmt("#define {}", { i(0) })),
}

return snippets
