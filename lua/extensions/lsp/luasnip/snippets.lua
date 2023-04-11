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

local javascript = require("extensions.snippets.javascript")
local terraform  = require("extensions.snippets.terraform")
local tex        = require("extensions.snippets.tex")
local vue        = require("extensions.snippets.vue")
local all = {
  s("bash", f(bash, {}, "ls")),
  s("part", p(os.date, "%Y")),
}

ls.add_snippets('all', all)
ls.add_snippets('javascript', javascript)
ls.add_snippets('terraform', terraform)
ls.add_snippets('tex', tex)
ls.add_snippets('typescript', javascript)
ls.add_snippets('typescriptreact', javascript)
ls.add_snippets('vue', vue)

require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })

ls.filetype_extend("ruby", {"rails"})
ls.filetype_extend("html", {"twig"})
