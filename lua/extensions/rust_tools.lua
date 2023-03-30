local rt = require("rust-tools")

local on_attach = require("lsp.primary.on_attach")
local capabilities = require('lsp.capabilities')

rt.setup {
  server = {
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      vim.keymap.set("n", "<C-Space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>as", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    capabilities = capabilities,
  },
  tools = {
    inlay_hints = {
      auto = false,
    },
  },
}
