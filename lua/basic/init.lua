local utils = require("utils.core")

local modules = {
  "autocmds",
  -- "colorscheme",
  "mappings",
  "options",
}

utils.load_modules("basic", modules)
