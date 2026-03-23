local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
      },
      -- schemas = require('schemastore').yaml.schemas(),
      schemas = {
        ['https://raw.githubusercontent.com/harness/harness-schema/main/v0/pipeline.json'] = { 'pipeline.yaml', 'pipeline.tftpl' },
      },
    },
  },
}
