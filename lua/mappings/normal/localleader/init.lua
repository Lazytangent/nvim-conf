return {
  { "<leader>m",     group = "Local leader" },
  { "<leader>m'",    require('femaco.edit').edit_code_block, desc = "Edit code block with FeMaco" },
  { "<leader>m<CR>", function() vim.cmd "nohlsearch" end,    desc = "Turn off highlight" },

  { "<leader>mgt",  group = "Toggle" },
  { "<leader>mgtd", desc = "Toggle deleted" },

  { "<leader>ml",  group = "LaTeX" },
  { "<leader>mlC", desc = "Clean full" },
  { "<leader>mlG", desc = "Status all" },
  { "<leader>mlI", desc = "Full Info" },
  { "<leader>mlK", desc = "Stop all" },
  { "<leader>mlL", desc = "Compile selected" },
  { "<leader>mlT", desc = "Toggle TOC" },
  { "<leader>mlX", desc = "Reload state" },
  { "<leader>mla", desc = "Context menu" },
  { "<leader>mlc", desc = "Clean" },
  { "<leader>mle", desc = "Errors" },
  { "<leader>mlg", desc = "Status" },
  { "<leader>mli", desc = "Info" },
  { "<leader>mlk", desc = "Stop" },
  { "<leader>mll", desc = "Compile" },
  { "<leader>mlm", desc = "imaps list" },
  { "<leader>mlo", desc = "Compile output" },
  { "<leader>mlq", desc = "Log" },
  { "<leader>mlr", desc = "Reverse search" },
  { "<leader>mls", desc = "Toggle main" },
  { "<leader>mlt", desc = "Open TOC" },
  { "<leader>mlv", desc = "View" },
  { "<leader>mlx", desc = "Reload" },

  { "<leader>mo", require("oil").open_float },

  { "<leader>mp",  group = "LSP Pickers" },
  { "<leader>mpc", desc = "LSP Code Actions" },
  { "<leader>mpe", desc = "LSP References" },
  { "<leader>mpi", desc = "LSP Implementations" },
  { "<leader>mpr", desc = "LSP Rename" },
  { "<leader>mpt", desc = "LSP Type Definition" },

  { "<leader>mpw",  group = "Workspace Folders" },
  { "<leader>mpwa", desc = "Add workspace folder" },
  { "<leader>mpwl", desc = "List workspace folders" },
  { "<leader>mpwr", desc = "Remove workspace folder" },
  { "<leader>mr",   desc = "Rename" },

  { "<leader>mt",  group = "TableMode" },
  { "<leader>mtm", desc = "Toggle table mode" },
  { "<leader>mtt", desc = "Tableize" },
}
