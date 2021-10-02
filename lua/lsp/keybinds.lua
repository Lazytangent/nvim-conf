local nvim_lsp = require("lspconfig")
local on_attach = require("lsp.on_attach")
local capabilities = require("lsp.capabilities")

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = LSP.servers
local configs = require("lspconfig/configs")

-- configs.emmet_ls = {
--   default_config = {
--     cmd = { "emmet-ls", "--stdio" },
--     filetypes = { "html", "css" },
--     root_dir = function(fname)
--       return vim.loop.cwd()
--     end,
--     settings = {},
--   },
-- }

-- configs.ls_emmet = {
--   default_config = {
--     cmd = { 'ls_emmet', '--stdio' };
--     filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' };
--     root_dir = function(fname)
--       return vim.loop.cwd()
--     end;
--     settings = {};
--   }
-- }

for _, lsp in ipairs(servers) do
  -- nvim_lsp.emmet_ls.setup({ capabilities = capabilities })

  if lsp == "html" then
    nvim_lsp[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
  elseif lsp == "denols" then
    nvim_lsp[lsp].setup({ autostart = false })
  elseif lsp == "elixirls" then
    nvim_lsp[lsp].setup({ cmd = { "elixirls" }, capabilities = capabilities })
  elseif lsp == "sqlls" then
    nvim_lsp[lsp].setup({ cmd = { "sql-language-server", "up", "--method", "stdio" }, capabilities = capabilities })
  elseif lsp == "gopls" then
    nvim_lsp[lsp].setup({
      cmd = { "gopls", "serve" },
      settings = {
        gopls = {
          analyses = {
            unusuedparams = true,
          },
          staticcheck = true,
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })
  elseif lsp == "java_language_server" then
    nvim_lsp[lsp].setup({
      cmd = { "/Users/petermai/Documents/LSP/java-language-server/dist/lang_server_mac.sh" },
      -- capabilities = capabilities,
    })
  elseif lsp == "groovyls" then
    nvim_lsp[lsp].setup({
      cmd = { "java", "-jar", "~/Documents/LSP/groovy-language-server/build/libs/groovy-language-server-all.jar" },
      capabilities = capabilities,
    })
  -- elseif lsp == "ls_emmet" then
  --   nvim_lsp[lsp].setup {
  --     capabilities = capabilities,
  --   }
  else
    nvim_lsp[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
  end
end
