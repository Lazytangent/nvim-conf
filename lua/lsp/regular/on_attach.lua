local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

  buf_set_keymap("n", "<leader><leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  buf_set_keymap("n", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
  buf_set_keymap("n", "<leader><leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  buf_set_keymap("n", "<leader><leader>lc", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  buf_set_keymap("n", "<space>,f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

return on_attach
