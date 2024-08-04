local ls = require("luasnip")
local s = ls.snippet
local p = require("luasnip.extras").partial

ls.setup({
  history = true,
  update_events = "TextChangedI",
  store_selection_keys = "<Tab>",
  load_ft_func = require('luasnip.extras.filetype_functions').extend_load_ft({
    tex = { "greek" },
    org = { "greek", "tex", "latex" },
    typescript = { "javascript" },
    typescriptreact = { "javascript" },
  }),
})

ls.log.set_loglevel("info")

local function bash(_, _, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

local all = {
  s("bash", p(bash, {}, { user_args = { "ls" } })),
  s("year", p(os.date, "%Y")),
  s("today", p(os.date, "%Y-%m-%d")),
}

ls.add_snippets('all', all)

require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })

ls.filetype_extend("ruby", {"rails"})
ls.filetype_extend("html", {"twig"})
ls.filetype_extend("org", {"tex", "greek"})
