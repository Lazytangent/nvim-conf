local snippets = {
  s({ trig = "func", name = "function", dscr = "Function" },
    fmta([[
    function <>(<>)
      <>
    end<>
    ]], {
      i(1, "name"),
      i(2, "args"),
      i(3, "body"),
      i(0),
    })
  ),
}

return snippets
