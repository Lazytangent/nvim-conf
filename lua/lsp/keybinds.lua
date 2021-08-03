local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  buf_set_keymap('n', ',,f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", ",,f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", ",,f", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
  end

  -- Set autocommands conditional on server capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec([[
  --     highlight LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  --     highlight LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  --     highlight LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = LSP.servers
local configs = require('lspconfig/configs')
for _, lsp in ipairs(servers) do
  if not nvim_lsp.emmet_ls then
    configs.emmet_ls = {
      default_config = {
        cmd = {'emmet-ls', '--stdio'};
        filetypes = {'html', 'css'};
        root_dir = function(fname)
          return vim.loop.cwd()
        end;
        settings = {};
      };
    }
  end
  nvim_lsp.emmet_ls.setup { capabilities = capabilities }

  if lsp == 'html' then
    nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
  elseif lsp == 'denols' then
    nvim_lsp[lsp].setup { autostart = false }
  elseif lsp == 'elixirls' then
    nvim_lsp[lsp].setup { cmd = {'elixirls'} }
  elseif lsp == 'sqlls' then
    nvim_lsp[lsp].setup { cmd = {'sql-language-server', 'up', '--method', 'stdio'} }
  elseif lsp == 'gopls' then
    nvim_lsp[lsp].setup {
      cmd = {"gopls", "serve"},
      settings = {
        gopls = {
          analyses = {
            unusuedparams = true,
          },
          staticcheck = true,
        },
      },
      on_attach = on_attach,
    }
  elseif lsp == 'java_language_server' then
    nvim_lsp[lsp].setup {
      cmd = {'/Users/petermai/Documents/LSP/java-language-server/dist/lang_server_mac.sh'},
    }
  elseif lsp == 'groovyls' then
    nvim_lsp[lsp].setup {
      cmd = { "java", "-jar", "~/Documents/LSP/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    }
  else
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end
end

local autopep8 = require 'efm.autopep8'

nvim_lsp.efm.setup {
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  root_dir = vim.loop.cwd,
  settings = {
    rootMarkers = {".git/"},
    lanuages = {
      python = {autopep8}
    }
  }
}
