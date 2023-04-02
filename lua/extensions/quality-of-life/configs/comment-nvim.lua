require('Comment').setup {
  ignore = '^$',
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = function(ctx)
    local u = require('Comment.utils')
    if ctx.ctype == u.ctype.line or ctx.cmotion == u.cmotion.line then
      local U = require 'Comment.utils'

      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring {
        key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
        location = location,
      }
    end
  end
}
