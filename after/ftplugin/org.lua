vim.cmd([[
  iabbrev jose JOSE
  iabbrev joseh JOSE Header
]])

require('user.abbrevs').apply_abbrevs()

vim.opt_local.conceallevel = 2
vim.opt_local.spell = true
vim.opt_local.formatoptions:append('r')

vim.keymap.set('i', '<C-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<cr>', {
  silent = true,
  buffer = true,
})
vim.treesitter.start()
