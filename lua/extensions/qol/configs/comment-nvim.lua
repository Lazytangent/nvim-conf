require('Comment').setup {
  ignore = '^$',
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
