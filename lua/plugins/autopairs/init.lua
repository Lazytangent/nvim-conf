local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup {}

npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

npairs.add_rules {
  Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' })
    :use_regex(true)
    :set_end_pair_length(2),
}
