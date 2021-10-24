require('Comment').setup {
  ignore = '^$',
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
  pre_hook = function(ctx)
    local u = require('Comment.utils')
    if ctx.ctype == u.ctype.line or ctx.cmotion == u.cmotion.line then
      return require('ts_context_commentstring.internal').calculate_commentstring()
    end
  end
}
