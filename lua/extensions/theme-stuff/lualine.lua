return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- local jsonpath = require('jsonpath')

    local function indent()
      local softtabstop = vim.bo.softtabstop
      local shiftwidth = vim.bo.shiftwidth

      return "sts=" .. softtabstop .. ", sw=" .. shiftwidth
    end

    require("lualine").setup {
      extensions = { 'quickfix', 'fugitive' },
      options = {
        theme = 'auto',
        -- theme = 'citruszest',
        -- theme = 'oxocarbon',
        icons_enabled = false,
        globalstatus = true,
        refresh = {
          statusline = 500,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          { 'mode', fmt = function(str) return str:sub(1, 1) end },
        },
        lualine_b = {
          'branch',
          {'diagnostics', sources = { 'nvim_diagnostic', 'nvim_lsp' }}
        },
        lualine_c = {
          "os.date('%c')",
          { 'filename', file_status = true },
          'diff',
        },
        lualine_x = {
          indent,
          'encoding',
          'fileformat',
          'filetype',
        },
      },
      winbar = {
        lualine_c = {
          {"navic"},
          -- { jsonpath.get, cond = function() return vim.bo.filetype == "json" end },
        },
        lualine_y = {{'filename', path = 1}},
      },
      inactive_winbar = {
        lualine_y = {{'filename', path = 1}},
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
          },
        },
      },
    }
  end,
  lazy = false,
}
