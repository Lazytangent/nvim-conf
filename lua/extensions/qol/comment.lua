return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      ignore = '^$',
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}
