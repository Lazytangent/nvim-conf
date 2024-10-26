local parentModule = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'jsdoc',
  'prisma',
  'dbml',
  'vimtex',
  'kitty',
  'terraform',
  'go',
  'schemastore',
  'swift',
  'tailwindcss',
  'orgmode',
  'rust',
  'java',
  'typescript',

  -- 'haskell',
  -- 'velocity-vtl',
  -- 'cucumber',
  -- 'nim',
  -- 'flutter',
  -- 'dart',
  -- 'plantuml',
  -- 'typst',

  'helm',
  'beancount',
  'hcl',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parentModule .. name))
end

return modules
