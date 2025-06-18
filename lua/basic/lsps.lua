local lsps = {
  'tsgo',
  'ty',
}

for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp)
end
