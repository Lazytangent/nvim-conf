local parent_module = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'autopairs',
  'better-digraphs',
  'comment',
  'conform',
  'dial',
  'diffview',
  'dragvisuals',
  'easy-align',
  'emmet-vim',
  'femaco',
  'fidget',
  'folke',
  'gitsigns',
  'indent-blankline',
  'kitty-scrollback',
  'matchup',
  'navic',
  'neogit',
  'oil',
  'rainbow-csv',
  'rest',
  'surround',
  'table-mode',
  'targets',
  'tpope',
  'unicode',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parent_module .. name))

end

return modules
