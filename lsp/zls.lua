local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
  settings = {
    -- https://github.com/zigtools/zls/blob/master/schema.json
    zls = {
      semantic_tokens = "partial",
      inlay_hints_show_variable_type_hints = false,
      inlay_hints_show_struct_literal_field_type = false,
      inlay_hints_show_parameter_name = false,
      inlay_hints_show_builtin = false,
      warn_style = true,
      skip_std_references = true,
      zig_exe_path = vim.fn.expand("~/") .. ".local/bin/zigm",
    },
  },
}
