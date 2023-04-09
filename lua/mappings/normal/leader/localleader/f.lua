local utils = require('mappings.utils')

local f = {
  name = "+Telescope",
  a = { utils.extensions_telescope "search_all_files()",          "All files" },
  b = { utils.telescope_extensions "file_browser.file_browser()", "File browser" },
  f = { utils.telescope_builtin "current_buffer_fuzzy_find()",    "Fuzzy find" },
  g = { utils.telescope_builtin "git_status()",                   "Git" },
  l = { utils.telescope_extensions "lazygit.lazygit()",           "Lazygit" },
  p = { utils.telescope_builtin "resume()",                       "Resume" },
  P = { utils.telescope_builtin "pickers()",                      "Previous pickers" },
  t = { utils.telescope_builtin "tags()",                         "Tags" },

  d = { utils.telescope_builtin "lsp_definitions()",     "Definitions" },
  i = { utils.telescope_builtin "lsp_implementations()", "Implementations" },
  r = { utils.telescope_builtin "lsp_references()",      "References" },

  j = { utils.lua_require("extensions.telescope.custom.java", "files()"),       "Java Files" },
  B = { utils.lua_require("extensions.telescope.custom.java", "build_files()"), "Java Build Files" },
}

return f
