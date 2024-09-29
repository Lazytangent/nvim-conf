local javascript = {
  s({ trig = ";log", dscr = "console.log($1);$0", name = "Console log", snippetType = "autosnippet" },
    fmt(
      "console.log({});{}",
      { i(1), i(0) }
    )
  ),
}

return javascript
