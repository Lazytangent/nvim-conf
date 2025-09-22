local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  vim.keymap.set("n", "<C-h>",            vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<localleader>pt", vim.lsp.buf.type_definition, opts)

  vim.keymap.set("n", "<space>,f", function() require('conform').format({ async = true, bufnr = bufnr }) end, opts)

  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

  vim.keymap.set("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set("n", "]e", function() vim.diagnostic.jump({ count =  1, severity = vim.diagnostic.severity.ERROR }) end, opts)

  vim.keymap.set("n", "<space>q",  vim.diagnostic.setloclist, opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = {
    "*.py", -- python
    "*.tf", -- terraform
  },
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buf = event.buf

    on_attach(client, buf)
  end,
})

return on_attach
