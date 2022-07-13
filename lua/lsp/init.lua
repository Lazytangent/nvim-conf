local utils = require("utils.core")

local modules = {
  "formatting",
  "configure",
  "efm",
  "custom",
}

utils.load_modules("lsp", modules)
