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
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda

local function copy(args)
  return args[1]
end

local rec_ls = function()
  return sn(
    nil,
    c(1, {
      t(""),
      sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
    })
  )
end

local function bash(_, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

local javascript = require("extensions.snippets.javascript")
local org        = require("extensions.snippets.orgmode")
local terraform  = require("extensions.snippets.terraform")
local tex        = require("extensions.snippets.tex")
local vue        = require("extensions.snippets.vue")
local all = {
  s("bash", f(bash, {}, "ls")),
  s("part", p(os.date, "%Y")),
}

ls.add_snippets('all', all)
ls.add_snippets('javascript', javascript)
ls.add_snippets('org', org)
ls.add_snippets('terraform', terraform)
ls.add_snippets('tex', tex)
ls.add_snippets('typescript', javascript)
ls.add_snippets('typescriptreact', javascript)
ls.add_snippets('vue', vue)

require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

ls.filetype_extend("ruby", {"rails"})
ls.filetype_extend("html", {"twig"})
