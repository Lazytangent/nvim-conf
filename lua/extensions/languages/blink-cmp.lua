return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local p = require("luasnip.extras").partial
        local i = ls.insert_node
        local sn = ls.snippet_node

        ls.setup({
          enable_autosnippets = true,
          history = true,
          update_events = "TextChangedI",
          store_selection_keys = "<Tab>",
          load_ft_func = require('luasnip.extras.filetype_functions').extend_load_ft({
            cpp = { "c" },
            typescript = { "javascript" },
            typescriptreact = { "javascript" },
          }),
          snip_env = {
            autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" }),
            tex = {
              in_math = function() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end,
            },
            get_visual = function(_, parent)
              if (#parent.snippet.env.LS_SELECT_RAW > 0) then
                return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
              else
                return sn(nil, i(1, ''))
              end
            end,
          },
        })

        ls.log.set_loglevel("info")

        local function bash(_, _, command)
          local file = io.popen(command, "r")
          if file == nil then
            return
          end

          local res = {}
          for line in file:lines() do
            table.insert(res, line)
          end
          return res
        end

        local function yesterday()
          local date = os.time() - 24 * 60 * 60
          return os.date("%Y-%m-%d", date)
        end

        local all = {
          s("bash", p(bash, {}, { user_args = { "ls" } })),
          s("year", p(os.date, "%Y")),
          s("today", p(os.date, "%Y-%m-%d")),
          s("yesterday", p(yesterday)),
        }

        ls.add_snippets('all', all)

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })

        ls.filetype_extend("ruby", {"rails"})
        ls.filetype_extend("html", {"twig"})
        ls.filetype_extend("cpp", {"c"})
      end,
    },
    {
      'saghen/blink.compat',
      version = '2.*',
      lazy = true,
      opts = {},
    },
  },
  opts = {
    snippets = { preset = 'luasnip' },
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
      per_filetype = {
        gitcommit = { 'buffer' },
        sql = {
          'dadbod',
        },
        beancount = {},
        tex = {},
      },
      providers = {
        dadbod = { module = "vim_dadbod_completion.blink" },
        beancount = {
          name = "beancount",
          module = 'blink.compat.source',
          opts = {
            account = '~/.local/src/beancount/account.bean',
          },
        },
      },
    },
    cmdline = {
      enabled = true,
    },
    term = {
      enabled = true,
    },
  },
}
