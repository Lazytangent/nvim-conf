local utils = require("utils.core")

local modules = {
  "autocmds",
  "colorscheme",
  "mappings",
  "options",

  "lsps",
}

utils.load_modules("basic", modules)
