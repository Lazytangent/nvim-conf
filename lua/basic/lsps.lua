local lsps = {
  'tsgo',
  'uv_ty',
}

for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp)
end
