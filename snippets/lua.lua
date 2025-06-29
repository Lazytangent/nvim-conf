local snippets = {
  s({ trig = "func", name = "function", dscr = "Function" },
    c(1, {
      fmta(
        [[
        function <>(<>)
          <>
        end
        ]], { i(1, "name"), i(2, "args"), i(0, "body") }
      ),
      fmta(
        [[
        local function <> (<>)
          <>
        end
        ]], { i(1, "name"), i(2, "args"), i(0, "body") }
      ),
      fmta(
        [[
        local <> = function (<>)
          <>
        end
        ]], { i(1, "name"), i(2, "args"), i(0, "body") }
      ),
    })
  ),
}

return snippets
