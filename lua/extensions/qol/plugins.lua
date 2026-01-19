local parent_module = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'autopairs',
  'comment',
  'conform',
  'csv',
  'databases',
  'dial',
  'dragvisuals',
  'emmet-vim',
  'endec',
  'femaco',
  'fidget',
  'folke',
  'fzf',
  'helpview',
  'hydra',
  'import',
  'indent-blankline',
  'jq-playground',
  'kitty-scrollback',
  'kubectl',
  'leap',
  'marks',
  'matchup',
  'mini',
  'minibuffer',
  'navic',
  'octo',
  'oil',
  'printer',
  'profile',
  'quickfix',
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
