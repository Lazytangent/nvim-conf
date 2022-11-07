local enabled_langs = {
  "lua",
  "python",
}

require('tmindent').setup {
  enabled = function()
    return vim.tbl_contains(enabled_langs, vim.bo.filetype)
  end,
  use_treesitter = function() return true end,
  default_rule = {},
  rules = {},
}
