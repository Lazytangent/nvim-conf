local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Normal Mode
u.map("n", "<leader>w", ":w<cr>", { noremap = true })
u.map("n", "<leader>wq", ":wq<cr>", { noremap = true })
u.map("n", "<leader>q", ":q<cr>", { noremap = true })
u.map("n", "<leader>q", ":q<cr>", { noremap = true })

u.map("n", "<leader>o", "o<Esc>", { noremap = true })
u.map("n", "<leader>O", "O<Esc>", { noremap = true })
u.map("n", "<leader>qa", ":qa<cr>", { noremap = true })

u.map("n", "<leader>rnu", ":set rnu!<cr>", { noremap = true })
u.map("n", "<leader>nnu", ":set nu!<cr>", { noremap = true })

u.map("n", "<localleader>r", ":source ~/.config/nvim/init.lua<cr>", { noremap = true })

u.map("n", "<leader>fu", "zM<cr>", { noremap = true })
u.map("n", "<leader>uf", "zR<cr>", { noremap = true })

u.map("n", "<localleader>ct", ":!ctags -R .<cr><cr>", { noremap = true })
u.map("n", "<localleader>cd", ":cd %:h<cr>", { noremap = true })

u.map("n", "j", "gj")
u.map("n", "k", "gk")

-- Nvim Telescope
u.map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
u.map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
u.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
u.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })

-- Vim-Instant-Markdown
u.map("n", "<leader>md", ":InstantMarkdownPreview<cr>")
u.map("n", "<leader>ms", ":InstantMarkdownStop<cr>")

-- Drag Visuals
u.map("v", "<S-H>", "DVB_Drag('left')", { expr = true })
u.map("v", "<S-L>", "DVB_Drag('right')", { expr = true })
u.map("v", "<S-J>", "DVB_Drag('down')", { expr = true })
u.map("v", "<S-K>", "DVB_Drag('up')", { expr = true })

-- Line movement
u.map("n", "<C-k>", ":<C-U>exec \"exec 'norm m`' | move -\" . (1+v:count1)<cr>", { noremap = true })
u.map("n", "<C-j>", ":<C-U>exec \"exec 'norm m`' | move +\" . (0+v:count1)<cr>", { noremap = true })

u.map("i", "<C-k>", "<C-O>m`<C-O>:move -2<cr><C-O>``", { noremap = true })
u.map("i", "<C-j>", "<C-O>m`<C-O>:move +1<cr><C-O>``", { noremap = true })

u.map("v", "<C-k>", ":<C-U>exec \"'<,'>move '<-\" . (1+v:count1)<cr>gv", { noremap = true })
u.map("v", "<C-j>", ":<C-U>exec \"'<,'>move '>+\" . (0+v:count1)<cr>gv", { noremap = true })

-- Universal
u.map("", "Q", "gq")

-- Command
u.map("c", "Q", "q!")
