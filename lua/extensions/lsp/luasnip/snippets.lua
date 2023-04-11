local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local p = require("luasnip.extras").partial

local function bash(_, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

local all = {
  s("bash", f(bash, {}, "ls")),
  s("part", p(os.date, "%Y")),
}

ls.add_snippets('all', all)

require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })

ls.filetype_extend("ruby", {"rails"})
ls.filetype_extend("html", {"twig"})
