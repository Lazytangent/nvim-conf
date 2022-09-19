require("femaco").setup({
  prepare_buffer = function(opts)
    vim.cmd '30new'
    return vim.api.nvim_get_current_win()
  end
})
