local parent_module = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'autopairs',
  'better-digraphs',
  'comment',
  'conform',
  'dial',
  'dragvisuals',
  'easy-align',
  'emmet-vim',
  'endec',
  'femaco',
  'fidget',
  'folke',
  'helpview',
  'hydra',
  'import',
  'indent-blankline',
  'jq-playground',
  'kitty-scrollback',
  'kubectl',
  'matchup',
  'navic',
  'octo',
  'oil',
  'printer',
  'profile',
  'rainbow-csv',
  'render-markdown',
  'rest',
  'session-keys',
  'surround',
  'table-mode',
  'targets',
  'tpope',
  'unicode',
  'vcs',
  'workspaces',
  'yanky',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parent_module .. name))

end

return modules
