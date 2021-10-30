local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '{', all = '(' }}))

cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping({
      i = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ select = false }),
    }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    -- { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "calc" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "latex_symbols" },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'rg' },
    -- { name = "path" },
    { name = "crates" },
    { name = "tmux" },
    -- { name = "spell" },
    -- { name = "treesitter" },
    -- { name = "tags" },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  completion = {
    -- autocomplete = false,
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require('cmp-under-comparator').under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.lenth,
      cmp.config.compare.order,
    },
  },
  confirmation = {
    default_behavior = cmp.ConfirmBehavior.Replace,
  },
}

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' },
  },{
    { name = "buffer" },
  }),
})

cmp.setup.cmdline('?', {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(':', {
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})
