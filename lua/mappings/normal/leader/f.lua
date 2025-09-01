local telescope = require 'telescope.builtin'
local telescope_extensions = require('telescope').extensions

local utils = require 'user.utils'

local pickers = {
  commands = function()
    MiniExtra.pickers.history({ scope = ':' })
  end,
  search_history = function()
    MiniExtra.pickers.history({ scope = '?' })
  end,
  quickfix = function()
    MiniExtra.pickers.list({ scope = 'quickfix' })
  end,
  jumplist = function()
    MiniExtra.pickers.list({ scope = 'jump' })
  end,
  grep_this_word = function()
    MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') })
  end,
  files = function()
    MiniPick.builtin.files(nil, {
      mappings = {
        create = {
          char = '<CR>',
          func = utils.open_file_action,
        },
      },
    })
  end,
  config = function()
    MiniPick.builtin.files(nil, {
      source = {
        cwd = vim.fn.stdpath('config'),
      },
    })
  end,
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
  { "<leader>f",  group = "Finders" },
  { "<leader>fB", require('extensions.telescope.custom.java').build_files, desc = "Java Build Files" },
  { "<leader>fJ", require('extensions.telescope.custom.java').files,       desc = "Java Files" },
  { "<leader>fL", telescope_extensions.luasnip.luasnip,                    desc = "Luasnip" },

  { "<leader>fo", telescope.quickfixhistory, desc = "Quickfix History" },
  { "<leader>fp", telescope.pickers,         desc = "Pickers" },
  { "<leader>fz", telescope.tags,            desc = "Tags"    },

  -- mini.pick
  { "<leader>fD", lsp_pickers.definition,       desc = "LSP Definitions" },
  { "<leader>fG", git.modified,                 desc = "Git" },
  { "<leader>fO", MiniExtra.pickers.oldfiles,   desc = "Old files (recent)" },
  { "<leader>fP", pickers.config,               desc = "Private config" },
  { "<leader>fR", MiniExtra.pickers.registers,  desc = "Registers" },
  { "<leader>fS", lsp_pickers.document_symbol,  desc = "Symbols" },
  { "<leader>fT", MiniExtra.pickers.treesitter, desc = "Treesitter" },

  { "<leader>fb", MiniPick.builtin.buffers,     desc = "Buffers" },
  { "<leader>fc", MiniExtra.pickers.commands,   desc = "Commands" },
  { "<leader>fd", MiniExtra.pickers.diagnostic, desc = "Local diagnostics" },
  { "<leader>ff", pickers.files,                desc = "Files" },
  { "<leader>fg", MiniPick.builtin.grep_live,   desc = "Live grep" },
  { "<leader>fh", MiniPick.builtin.help,        desc = "Help tags" },
  { "<leader>fi", lsp_pickers.implementation,   desc = "LSP Implementations" },
  { "<leader>fj", pickers.jumplist,             desc = "Jumplist" },
  { "<leader>fk", MiniExtra.pickers.keymaps,    desc = "Keymaps" },
  { "<leader>fm", MiniExtra.pickers.marks,      desc = "Marks" },
  { "<leader>fq", pickers.quickfix,             desc = "Quickfix" },
  { "<leader>fr", lsp_pickers.references,       desc = "LSP References" },
  { "<leader>ft", pickers.grep_this_word,       desc = "This word" },

  { "<leader>f'", MiniPick.builtin.resume, desc = "Resume" },
  { "<leader>f;", pickers.commands, desc = "Command history" },
  { "<leader>f?", pickers.search_history,  desc = "Search history" },

  { "<leader>fl",  group = "LSP Stuff" },
  { "<leader>fld", MiniExtra.pickers.diagnostic, desc = "Diagnostics" },
  { "<leader>fls", lsp_pickers.document_symbol,  desc = "LSP Document Symbols" },

  { "<leader>fs",  "<cmd>w<cr>", desc = "Save file" },
}
