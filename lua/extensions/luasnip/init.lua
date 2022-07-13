local utils = require("utils.core")

local modules = {
  'config'
  'snippets'
}

utils.load_modules("extensions.luasnip", modules)
