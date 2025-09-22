local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
  end

  if client.server_capabilities.documentSymbols then
    require("nvim-navic").attach(client, bufnr)
  end

  -- Mappings
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  vim.keymap.set("n", "K",     vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<localleader>pt", vim.lsp.buf.type_definition, opts)

  vim.keymap.set("n", "<space>,f", function() require('conform').format({ async = true, bufnr = bufnr }) end, opts)

  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

  vim.keymap.set("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set("n", "]e", function() vim.diagnostic.jump({ count =  1, severity = vim.diagnostic.severity.ERROR }) end, opts)

  vim.keymap.set("n", "<space>q",  vim.diagnostic.setloclist, opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = {
    "*.bean",
    "*.js",
    "*.ts",
    "*.py", -- python
    "*.sql",
    "*.tf", -- terraform
    "*.yaml",
    "*.yml",
    "*.css",
    "*.tex",
    "*.typ",
    "*.lua",
    "*.html",
    "*.c",
    "*.cpp",
    "*.cc",
    "*.swift",
    "*.bash",
    "*.sh",
    "*.json",
    "*.jsonc",
    "Dockerfile",
    "docker-compose.*yaml",
    "docker-compose.*yml",
    "*.go",
    "*.zig",
    "*.zig.zon",
  },
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buf = event.buf

    on_attach(client, buf)
  end,
})

return on_attach
