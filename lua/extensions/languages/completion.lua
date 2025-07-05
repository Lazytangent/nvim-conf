return {
  -- "hrsh7th/nvim-cmp",
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  config = function()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    local beancount_src = {
      name = 'beancount',
      option = {
        account = '~/.local/src/beancount/account.bean',
      },
    }

    cmp.setup {
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-g>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ['<C-f>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping({
          i = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ select = false }),
        }),
        ["<C-x><C-n>"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = 'nvim_lsp' },
              { name = 'nvim_lsp_document_symbol' },
            },
          },
        }),
        ["<C-x>s"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "luasnip" },
            },
          },
        }),
        ["<C-x>S"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "spell" },
            },
          },
        }),
        ["<C-x><C-o>"] = cmp.mapping.complete(),
        ["<C-x><C-b>"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "buffer" },
            },
          },
        }),
        ["<C-x><C-p>"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "path" },
            },
          },
        }),
        ["<C-x><C-r>"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "rg" },
            },
          },
        }),
        ["<C-x><C-x>"] = cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              { name = "omni" },
            }),
          },
        }),
        ["<C-x><C-d>"] = cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              { name = "copilot" },
            }),
          },
        }),
      }),
      sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = 'nvim_lsp_signature_help' },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = 'rg' },
        { name = 'treesitter' },
        { name = 'git' },
        { name = "calc" },
        { name = "latex_symbols" },
        { name = 'nvim_lsp_document_symbol' },
        { name = "dotenv" },
        { name = 'orgmode' },
        { name = 'vim-dadbod-completion' },
        { name = "crates" },
        { name = "natdat" },
        beancount_src,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          require('cmp-under-comparator').under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      experimental = {
        ghost_text = true,
      },
      formatting = {
        format = require('lspkind').cmp_format({
          mode = "text_symbol",
          menu = ({
            buffer = "[Buffer]",
            ripgrep = "[Rg]",
            rg = "[Rg]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Nvim Lua]",
            latex_symbols = "[Latex]",
            natdat = "[Date]",
            ["vim-dadbod-completion"] = "[DB]",
            Copliot = "[Copilot]",
          }),
        }),
      },
      completion = {
        autocomplete = false,
      },
    }

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'buffer' },
      }),
    })

    cmp.setup.filetype('sql', {
      mapping = cmp.mapping.preset.insert({
        ["<C-x><C-n>"] = cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              { name = "vim-dadbod-completion" },
              { name = "sql" },
              { name = 'nvim_lsp' },
              { name = 'nvim_lsp_document_symbol' },
            }),
          },
        }),
      }),
    })

    cmp.setup.filetype('beancount', {
      mapping = cmp.mapping.preset.insert({
        ["<C-x><C-n>"] = cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              beancount_src,
            }),
          },
        }),
      }),
    })

    cmp.setup.filetype('tex', {
      mapping = cmp.mapping.preset.insert({
        ["<C-x><C-n>"] = cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "buffer" },
              { name = 'rg' },
              { name = 'git' },
              { name = "calc" },
              { name = "latex_symbols" },
              { name = 'nvim_lsp_document_symbol' },
              { name = "natdat" },
            }),
          },
        }),
      }),
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline({}),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
      },{
        { name = "buffer" },
      }),
      completion = {
        autocomplete = { 'InsertEnter', 'TextChanged' },
      },
    })

    cmp.setup.cmdline('?', {
      mapping = cmp.mapping.preset.cmdline({}),
      sources = {
        { name = "buffer" },
      },
      completion = {
        autocomplete = { 'InsertEnter', 'TextChanged' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({}),
      sources = {
        { name = 'path' },
        { name = "cmdline" },
      },
      completion = {
        autocomplete = { 'InsertEnter', 'TextChanged' },
      },
      formatting = {
        format = require('lspkind').cmp_format({
          mode = "test_symbol",
          menu = ({
            path = "[Path]",
            cmdline = "[Cmdline]",
          })
        }),
      },
    })
  end,
  dependencies = {
    "f3fora/cmp-spell",
    "hrsh7th/cmp-calc",
    { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
    { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
    { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp" },
    { "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-omni",
    "hrsh7th/cmp-path",
    "kdheepak/cmp-latex-symbols",
    "lukas-reineke/cmp-rg",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind-nvim",
    "ray-x/cmp-treesitter",
    "ray-x/cmp-sql",
    "saadparwaiz1/cmp_luasnip",
    "petertriho/cmp-git",
    "SergioRibera/cmp-dotenv",
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
      "Gelio/cmp-natdat",
      config = true,
    },
    "crispgm/cmp-beancount",
  },
}
