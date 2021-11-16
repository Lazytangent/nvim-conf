local nvim_lsp = require("lspconfig")
local on_attach = require("lsp.on_attach")
local capabilities = require("lsp.capabilities")

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = LSP.servers.regular
local configs = require("lspconfig/configs")

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
end
