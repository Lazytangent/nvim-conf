local snippets = {
  s(
    { trig = "std" },
    fmta('const std = @import("std");<>', { i(0) })
  ),
  s(
    { trig = "test" },
    fmta([[
    test "<>" {
        <>
    }
    ]], {
      i(1, "name"),
      i(0),
    })
  ),
}

return snippets
