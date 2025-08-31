local telescope = require 'telescope.builtin'
local telescope_extensions = require('telescope').extensions

local utils = require 'user.utils'

local pickers = {
  search_commands = function()
    MiniExtra.pickers.history({ scope = ':' })
  end,
  search_history = function()
    MiniExtra.pickers.history({ scope = '?' })
  end,
  search_quickfix = function()
    MiniExtra.pickers.list({ scope = 'quickfix' })
  end,
  search_jumplist = function()
    MiniExtra.pickers.list({ scope = 'jumplist' })
  end,
  grep_this_word = function()
    MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') })
  end
}

local lsp_pickers = {
  declaration = function()
    MiniExtra.pickers.lsp({ scope = 'declaration' })
  end,
  definition = function()
    MiniExtra.pickers.lsp({ scope = 'definition' })
  end,
  document_symbol = function()
    MiniExtra.pickers.lsp({ scope = 'document_symbol' })
  end,
  implementation = function()
    MiniExtra.pickers.lsp({ scope = 'implementation' })
  end,
  references = function()
    MiniExtra.pickers.lsp({ scope = 'references' })
  end,
  type_definition = function()
    MiniExtra.pickers.lsp({ scope = 'type_definition' })
  end,
  workspace_symbol = function()
    MiniExtra.pickers.lsp({ scope = 'workspace_symbol' })
  end,
}

local git = {
  modified = function()
    MiniExtra.pickers.git_files({ scope = 'modified' })
  end,
}

return {
  { "<leader>f",  group = "Telescope stuff" },
  { "<leader>fB", require('extensions.telescope.custom.java').build_files, desc = "Java Build Files" },
  { "<leader>fJ", require('extensions.telescope.custom.java').files,       desc = "Java Files" },
  { "<leader>fL", telescope_extensions.luasnip.luasnip,                    desc = "Luasnip" },
  { "<leader>fP", require('utils.core').search_nvim,                       desc = "Private config" },

  { "<leader>fo", telescope.quickfixhistory, desc = "Quickfix History" },
  { "<leader>fp", telescope.pickers,         desc = "Pickers" },
  { "<leader>fz", telescope.tags,            desc = "Tags"    },

  { "<leader>fD", lsp_pickers.definition,       desc = "LSP Definitions" },
  { "<leader>fG", git.modified,                 desc = "Git" },
  { "<leader>fO", MiniExtra.pickers.oldfiles,   desc = "Old files (recent)" },
  { "<leader>fR", MiniExtra.pickers.registers,  desc = "Registers" },
  { "<leader>fS", lsp_pickers.document_symbol,  desc = "Symbols" },
  { "<leader>fT", MiniExtra.pickers.treesitter, desc = "Treesitter" },
  { "<leader>fb", MiniPick.builtin.buffers,     desc = "Buffers" },
  { "<leader>fc", MiniExtra.pickers.commands,   desc = "Commands" },
  { "<leader>fd", MiniExtra.pickers.dianostic,  desc = "Local diagnostics" },
  { "<leader>fg", MiniPick.builtin.grep_live,   desc = "Live grep" },
  { "<leader>fh", MiniPick.builtin.help,        desc = "Help tags" },
  { "<leader>fi", lsp_pickers.implementation,   desc = "LSP Implementations" },
  { "<leader>fj", pickers.search_jumplist,      desc = "Jumplist" },
  { "<leader>fk", MiniExtra.pickers.keymaps,    desc = "Keymaps" },
  { "<leader>fm", MiniExtra.pickers.marks,      desc = "Marks" },
  { "<leader>fq", pickers.search_quickfix,      desc = "Quickfix" },
  { "<leader>fr", lsp_pickers.references,       desc = "LSP References" },
  { "<leader>ft", pickers.grep_this_word,       desc = "This word" },

  { "<leader>f'", MiniPick.builtin.resume, desc = "Resume" },
  { "<leader>f;", pickers.search_commands, desc = "Command history" },
  { "<leader>f?", pickers.search_history,  desc = "Search history" },

  {
    "<leader>ff",
    function()
      MiniPick.builtin.files(nil, {
        mappings = {
          choose = '<C-CR>',
          create = {
            char = '<CR>',
            func = utils.open_file_action,
          },
        },
      })
    end,
    desc = "Files",
  },

  { "<leader>fl",  group = "LSP Stuff" },
  { "<leader>fld", telescope.diagnostics,          desc = "Diagnostics" },
  { "<leader>fls", telescope.lsp_document_symbols, desc = "LSP Document Symbols" },

  { "<leader>fs",  "<cmd>w<cr>", desc = "Save file" },
}
