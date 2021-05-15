local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Normal Mode
u.map("n", "<leader>w", ":w<cr>")
u.map("n", "<leader>wq", ":wq<cr>")
u.map("n", "<leader>q", ":q<cr>")
u.map("n", "<leader>q", ":q<cr>")

u.map("n", "<leader>o", "o<Esc>")
u.map("n", "<leader>O", "O<Esc>")
u.map("n", "<leader>qa", ":qa<cr>")

u.map("n", "<leader>rnu", ":set rnu!<cr>")
u.map("n", "<leader>nnu", ":set nu!<cr>")

u.map("n", "<localleader>r", ":source ~/.config/nvim/init.lua<cr>")

u.map("n", "<leader>fu", "zM<cr>")
u.map("n", "<leader>uf", "zR<cr>")

u.map("n", "<localleader>ct", ":!ctags -R .<cr><cr>")
u.map("n", "<localleader>cd", ":cd %:h<cr>")

u.map("n", "j", "gj")
u.map("n", "k", "gk")

-- Line movement
u.map("n", "<C-k>", ":<C-U>exec \"exec 'norm m`' | move -\" . (1+v:count1)<cr>")
u.map("n", "<C-j>", ":<C-U>exec \"exec 'norm m`' | move +\" . (0+v:count1)<cr>")

u.map("i", "<C-k>", "<C-O>m`<C-O>:move -2<cr><C-O>``")
u.map("i", "<C-j>", "<C-O>m`<C-O>:move +1<cr><C-O>``")

u.map("v", "<C-k>", ":<C-U>exec \"'<,'>move '<-\" . (1+v:count1)<cr>gv")
u.map("v", "<C-j>", ":<C-U>exec \"'<,'>move '>+\" . (0+v:count1)<cr>gv")

-- Universal
u.map("", "Q", "gq")

-- Command
u.map("c", "Q", "q!")
