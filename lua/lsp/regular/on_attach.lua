local utils = require("mappings.utils")

local on_attach = function(client, bufnr)
  -- local opts = { noremap = true, silent = true }
  -- vim.keymap.set("n", "gd", utils.lua_cmd("vim.lsp.buf.definition()"), opts)
  -- vim.keymap.set("n", "gD", utils.lua_cmd("vim.lsp.buf.declaration()"), opts)

  -- vim.keymap.set("n", "<C-h>",            utils.lua_cmd("vim.lsp.buf.signature_help()"), opts)
  -- vim.keymap.set("n", "<localleader>pwa", utils.lua_cmd("vim.lsp.buf.add_workspace_folder()"), opts)
  -- vim.keymap.set("n", "<localleader>pwr", utils.lua_cmd("vim.lsp.buf.remove_workspace_folder()"), opts)
  -- vim.keymap.set("n", "<localleader>pwl", utils.lua_cmd("print(vim.inspect(vim.lsp.buf.list_workspace_folders()))"), opts)
  -- vim.keymap.set("n", "<localleader>pt",  utils.lua_cmd("vim.lsp.buf.type_definition()"), opts)
  -- vim.keymap.set("n", "<localleader>pc",  utils.lua_cmd("vim.lsp.buf.code_action()"), opts)
  -- vim.keymap.set("n", "<localleader>pr",  utils.lua_cmd("vim.lsp.buf.rename()"), opts)
  -- vim.keymap.set("n", "<localleader>r",   utils.lua_cmd("vim.lsp.buf.rename()"), opts)
  -- vim.keymap.set("n", "<space>,f",        function() require("conform").format({ async = true }) end, opts)

  -- vim.keymap.set("n", "<leader>e", utils.lua_cmd("vim.diagnostic.open_float()"), opts)
  -- vim.keymap.set("n", "[d",        utils.lua_cmd("vim.diagnostic.goto_prev()"), opts)
  -- vim.keymap.set("n", "]d",        utils.lua_cmd("vim.diagnostic.goto_next()"), opts)
  -- vim.keymap.set("n", "[e",        utils.lua_cmd("vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })"), opts)
  -- vim.keymap.set("n", "]e",        utils.lua_cmd("vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })"), opts)
  -- vim.keymap.set("n", "<space>q",  utils.lua_cmd("vim.diagnostic.setloclist()"), opts)
end

return on_attach
