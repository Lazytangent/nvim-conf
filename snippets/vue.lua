local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({ trig = "vv", dscr = "Set up Vue file", name = "Set up Vue file" },
    fmt(
    [[
    <template>
      {}
    </template>

    <script>
      export default {{
        {}
      }}
    </script>

    <style></style>
    ]],
    { i(1), i(2) }
    )
  ),
}
