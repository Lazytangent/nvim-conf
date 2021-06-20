local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Vim-Instant-Markdown
u.map("n", "<leader>md", ":InstantMarkdownPreview<cr>")
u.map("n", "<leader>ms", ":InstantMarkdownStop<cr>")

-- Drag Visuals
u.map("v", "<S-H>", "DVB_Drag('left')", { expr = true })
u.map("v", "<S-L>", "DVB_Drag('right')", { expr = true })
u.map("v", "<S-J>", "DVB_Drag('down')", { expr = true })
u.map("v", "<S-K>", "DVB_Drag('up')", { expr = true })

-- Vim-Test
u.map("n", "t<C-n>", ":TestNearest<cr>", { silent = true })
u.map("n", "t<C-f>", ":TestFile<cr>", { silent = true })
u.map("n", "t<C-s>", ":TestSuite<cr>", { silent = true })
u.map("n", "t<C-l>", ":TestLast<cr>", { silent = true })
u.map("n", "t<C-g>", ":TestVisit<cr>", { silent = true })

-- Nvim Tree
u.map("",  "<leader>nn", ":NvimTreeToggle<cr>")
u.map("",  "<leader>nf", ":NvimTreeFindFile<cr>")

-- Vim-TailwindCSS
u.map("n", "<leader>tw", ":set completefunc=tailwind#complete<cr>")

-- Prettier
u.map("n", "<localleader>pg", "<cmd>Prettier<cr><cmd>w | e<cr>")

-- Vim-Fugitive
u.map("n", "<leader>gs", ":Git<cr>", { noremap = true })
u.map("n", "<leader>gw", ":Gw<cr>", { noremap = true })
u.map("n", "<leader>gc", ":Git commit<cr>", { noremap = true })
u.map("n", "<leader>gp", ":Git push<cr>", { noremap = true })
u.map("n", "<leader>gl", ":Git pull<cr>", { noremap = true })

-- Trouble.nvim
u.map("n", "<localleader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xw", "<cmd>Trouble lsp_workspace_diagnostic<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
u.map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
