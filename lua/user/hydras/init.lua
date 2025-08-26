local parent_module = (...):match("(.-)[^%.]+$")
local current_module = parent_module .. 'hydras.'

local hydras = {
  'git_submode',
  'magit',
}

for _, hydra in ipairs(hydras) do
  require(current_module .. hydra)
end
