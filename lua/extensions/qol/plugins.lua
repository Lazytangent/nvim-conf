local parent_module = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'autopairs',
  -- 'better-digraphs',
  'comment',
  -- 'conform',
  'dial',
  -- 'diffview',
  -- 'dragvisuals',
  'easy-align',
  -- 'emmet-vim',
  'endec',
  -- 'femaco',
  -- 'fidget',
  'folke',
  'gitsigns',
  -- 'helpview',
  -- 'indent-blankline',
  'jq-playground',
  -- 'kitty-scrollback',
  'matchup',
  -- 'navic',
  -- 'neogit',
  -- 'octo',
  -- 'oil',
  'profile',
  -- 'rainbow-csv',
  -- 'rest',
  'surround',
  'table-mode',
  'targets',
  'tpope',
  'unicode',
  -- 'yanky',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parent_module .. name))

end

return modules
