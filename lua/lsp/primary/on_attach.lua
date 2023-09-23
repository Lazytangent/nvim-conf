local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.buf.inlay_hint(bufnr, true)
  end

  require("nvim-navic").attach(client, bufnr)

  -- Mappings
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)

  vim.keymap.set("n", "K",     vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<localleader>pwa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<localleader>pwr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<localleader>pwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

  vim.keymap.set("n", "<localleader>pt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<localleader>pr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<localleader>r",  vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "<space>,f", function() vim.lsp.buf.format({ async = true }) end, opts)

  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d",        vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d",        vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[e",        function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set("n", "]e",        function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set("n", "<space>q",  vim.diagnostic.set_loclist, opts)
end

return on_attach
