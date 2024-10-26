local parentModule = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'beancount',
  'dbml',
  'go',
  'hcl',
  'helm',
  'java',
  'jsdoc',
  'kitty',
  'orgmode',
  'prisma',
  'rust',
  'schemastore',
  'swift',
  'tailwindcss',
  'terraform',
  'typescript',
  'vimtex',

  'lsp',
  'completion',
  'neodev',
  'nonels',

  -- 'haskell',
  -- 'velocity-vtl',
  -- 'cucumber',
  -- 'nim',
  -- 'flutter',
  -- 'dart',
  -- 'plantuml',
  -- 'typst',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parentModule .. name))
end

return modules
