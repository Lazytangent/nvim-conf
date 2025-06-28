local utils = require("utils.core")

local modules = {
  "formatting",
  "configure",
  "efm",
}

utils.load_modules("lsp", modules)
