return {
  -- Edit code blocks nested inside other buffers
  "AckslD/nvim-FeMaco.lua",
  opts = {
    prepare_buffer = function(opts)
      vim.cmd '30new'
      return vim.api.nvim_get_current_win()
    end,
    ensure_newline = function(base_filetype)
      return true
    end,
  },
  event = "VeryLazy",
}
