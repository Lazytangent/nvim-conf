local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local luasnip = require('luasnip')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping({
      i = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ select = false }),
    }),
    ['<C-f>'] = cmp.mapping.close(),
    ['<C-g>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
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
    ["<C-x><C-g>"] = cmp.mapping.complete({
      config = {
        sources = cmp.config.sources({
          { name = "git" },
        }),
      },
    }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = 'rg' },
    { name = 'treesitter' },
    { name = 'git' },
    { name = "calc" },
    { name = "latex_symbols" },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'orgmode' },
    { name = 'vim-dadbod-completion' },
    { name = "crates" },
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
      mode = "test_symbol",
      menu = ({
        buffer = "[Buffer]",
        ripgrep = "[Rg]",
        rg = "[Rg]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Nvim Lua]",
        latex_symbols = "[Latex]",
      })
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
