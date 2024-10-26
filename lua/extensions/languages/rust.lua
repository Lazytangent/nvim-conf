return {
  "mrcjkb/rustaceanvim",
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local utils = require('mappings.utils')

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbols then
        require("nvim-navic").attach(client, bufnr)
      end

      -- Mappings
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)

      vim.keymap.set("n", "K",     vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)

      vim.keymap.set("n", "<localleader>pt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<localleader>pr", vim.lsp.buf.rename,          opts)
      vim.keymap.set("n", "<localleader>r",  vim.lsp.buf.rename,          opts)
      vim.keymap.set("n", "<leader>la",      vim.lsp.buf.code_action,     opts)

      vim.keymap.set("n", "<space>,f", function() require('conform').format({ async = true, bufnr = bufnr }) end, opts)

      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

      vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count =  1 }) end, opts)

      vim.keymap.set("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, opts)
      vim.keymap.set("n", "]e", function() vim.diagnostic.jump({ count =  1, severity = vim.diagnostic.severity.ERROR }) end, opts)

      vim.keymap.set("n", "<space>q",  vim.diagnostic.setloclist, opts)
    end

    vim.g.rustaceanvim = {
      server = {
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          vim.keymap.set("n", "<Leader>as", function() vim.cmd.RustLsp('codeAction') end, { buffer = bufnr })
        end,
        capabilities = capabilities,
      },
    }
  end,
}
