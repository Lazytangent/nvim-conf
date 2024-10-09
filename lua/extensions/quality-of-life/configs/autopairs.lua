local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup {
  enable_abbr = true,
}

npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

npairs.add_rules {
  -- From https://github.com/windwp/nvim-autopairs/issues/314
  Rule(" ", " ")
    :with_pair(cond.done())
    :replace_endpair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      if vim.tbl_contains({ "()", "{}", "[]" }, pair) then
        return " " -- it return space here
      end
      return ""-- return empty
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ "(  )", "{  }", "[  ]" }, context)
  end),
  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']'),
  Rule('~', '~', 'org')
    :with_pair(cond.not_before_regex_check("%g"))
    :with_move(function(opts)
      return opts.next_char == opts.char
    end),
  Rule('{% ', ' %', { 'html', 'htmldjango', 'htmljinja' }),
}

npairs.get_rule("'")[1].not_filetypes = { "scheme", "lisp", "elisp", "rust", "tex" }

npairs.get_rule("[").not_filetypes = { "tex" }
npairs.get_rule('"')[1].not_filetypes = { "tex" }
