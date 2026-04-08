local function setup()
  -- will allow me to `require` configs per module later
  local configs = {
    ai = {
      custom_textobjects = {
        f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        I = require("mini.extra").gen_ai_spec.indent(),
      },
    },
    align = true,
    bracketed = true,
    -- enable mini.cmdline for peek
    cmdline = {
      autocomplete = {
        enable = false,
      },
      autocorrect = {
        enable = false,
      },
    },
    comment = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
    extra = true,
    files = true,
    pick = {
      mappings = {
        choose_marked = "<C-CR>",
      },
      options = {
        content_from_bottom = true,
      },
    },
  }

  for module, config in pairs(configs) do
    local full_module_name = "mini." .. module

    if config == true then
      require(full_module_name).setup()
    else
      require(full_module_name).setup(config)
    end
  end
end

return {
  "nvim-mini/mini.nvim",
  config = setup,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}
