local parent_module = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'beancount',
  'clojure',
  'dbml',
  'fennel',
  'go',
  'hcl',
  'helm',
  'info',
  'java',
  'jsdoc',
  'kitty',
  'lisp',
  'moonscript',
  -- 'nu',
  'orgmode',
  'postgresql',
  'prisma',
  -- 'python',
  'rust',
  'schemastore',
  'swift',
  'tailwindcss',
  'terraform',
  'typescript',
  'tex',

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
  'typst',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parent_module .. name))
end

return modules
