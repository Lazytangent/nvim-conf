local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local m = require("luasnip.extras").match
local p = require("luasnip.extras").partial
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local parse = require("luasnip").parser.parse_snippet

local function copy(args)
  return args[1]
end

local function dynamic_copy(args, old_state)
  if not old_state then
    old_state = {}
  end

  local node = i(1, args[1])
  local snip = sn(nil, node)
  snip.old_state = old_state
  return snip
end

local javascript = {
  s({ trig = "ctx", dscr = "Create Context", name = "Create Context" },
    fmta(
    [[
    const <> = createContext();
    export const <> = () =>> useContext(<>);

    const <> = ({ children }) =>> {
      <>
      return (
        <<<>.Provider value={{<>}}>>
          {children}
        <</<>.Provider>>
      );
    };

    export default <>;
    ]],
    {
      i(1, "NameOfContext"),
      i(2, "useContextHook"),
      f(copy, 1),
      i(3, "ContextProvider"),
      i(0),
      f(copy, 1),
      i(4),
      f(copy, 1),
      f(copy, 3),
    }
    )
  ),
  s({ trig = "fnc", dscr = "Functional Component", name = "Functional Component" },
    fmta(
    [[
    const <> = (<>) =>> {
      <>
      return (
        <<h2>><> works!<</h2>>
      );
    };

    export default <>;
    ]],
    {
      i(1, "Component"),
      c(2, {
        i(nil, "props"),
        sn(nil, fmta("{<>}", { i(1, "props") }))
      }),
      i(0),
      f(copy, 1),
      f(copy, 1)
    }
    )
  ),
  s({ trig = "rj", dscr = "Parse the JSON body of a response", name = "Parse JSON body of a response" },
    fmta(
      "const <> = await res.json();",
      { c(1, {
        i(nil, "name"),
        sn(nil,
          fmta("{<>}", i(1, "name"))
        )
      }) }
    )
  ),
  s({ trig = "response.json", dscr = "Parse the JSON body of a response", name = "Parse JSON body of a response" },
    fmta(
      "const <> = await response.json();",
      {
        c(1, {
          i(nil, "name"),
          sn(nil, fmta(
            "{<>}", { i(1, "name") }
          ))
        })
      }
    )
  ),
  s({ trig = "cr", dscr = "const _____ = require('_____');", name = "CommonJS import" },
    fmt(
      'const {} = require("{}");',
      { i(2, "name"), i(1, "module") }
    )
  ),
  s({ trig = "log", dscr = "console.log($1);$0", name = "Console log" },
    fmt(
      "console.log({});{}",
      { i(1), i(0) }
    )
  ),
  s({ trig = "edc", dscr = "Export default a const variable", name = "Export default const" },
    fmt(
      [[
      const {}

      export default {};
      ]],
      { i(1, "name"), f(copy, 1) }
    )
  ),
  s({ trig = "edcl", dscr = "Export default class", name = "Export default class" },
    fmta(
      [[
      export default class <> {
        <>
      }
      ]],
      { i(1, "name"), i(0) }
    )
  ),
  s({ trig = "edf", dscr = "Export default function with function declaration syntax", name = "Export default function" },
    fmta(
      [[
      export default function <> (<>) {
        <>
      }
      ]],
      { i(1, "name"), i(2, "params"), i(0) }
    )
  ),
  s({ trig = "Pkc", dscr = "A Sequelize model's static findByPk method", name = "findByPk" },
    fmt(
      "const {} = {}.findByPk({});",
      { i(3, "variable"), i(1, "Model"), i(2) }
    )
  ),
  s({ trig = "fA", dscr = "A Sequelize model's static findAll method", name = "findAll" },
    fmt(
      "const {} = {}.findAll({});",
      { i(3, "variable"), i(1, "Model"), i(2) }
    )
  ),
}

local redux = require("extensions.snippets.redux")
local react = require("extensions.snippets.react")
vim.list_extend(javascript, redux)
vim.list_extend(javascript, react)

return javascript
