local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Normal Mode Save and Quit Commands
u.map("n", "<leader>w", ":w<cr>", { noremap = true })
u.map("n", "<localleader>wq", ":wq<cr>", { noremap = true })
u.map("n", "<leader>q", ":q<cr>", { noremap = true })
u.map("n", "<leader>Q", ":q!<cr>", { noremap = true })

-- Insert Mode Save
u.map("n", "<localleader>o", "o<Esc>", { noremap = true })
u.map("n", "<localleader>O", "O<Esc>", { noremap = true })

u.map("n", "<localleader>nr", ":set rnu!<cr>", { noremap = true })
u.map("n", "<localleader>nn", ":set nu!<cr>", { noremap = true })

u.map("n", "<localleader>r", ":source ~/.config/nvim/init.lua<cr>", { noremap = true })

u.map("n", "<leader>ct", ":!ctags -R .<cr><cr>", { noremap = true })
u.map("n", "<leader>cd", ":cd %:h<cr>", { noremap = true })

u.map("n", "j", "gj")
u.map("n", "k", "gk")

-- Visual Mode Selection
u.map("v", "*", ":<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>", { silent = true, noremap = true })
u.map("v", "#", ":<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>", { silent = true, noremap = true })

-- Moving around tabs, windows, and buffers
u.map("",  "<leader><cr>", ":noh<cr>", { silent = true })

u.map("",  "<leader>ba", [[:%bd|e#|bd#<cr>]])
u.map("",  "<leader>l", [[:bnext<cr>]])
u.map("",  "<leader>h", [[:bprevious<cr>]])

u.map("",  "<leader>tn", ":tabnew<cr>")
u.map("",  "<leader>to", ":tabonly<cr>")
u.map("",  "<leader>tc", ":tabclose<cr>")
u.map("",  "<leader>tm", ":tabmove<cr>")
u.map("",  "<leader>tr", ":tabonly<cr>")

u.map("",  "<leader>te", [[:tabedit <C-r>=expand("%:p:h")<cr>/]])
u.map("",  "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

-- Spell Checking
u.map("",  "<leader>ss", ":setlocal spell!<cr>")
u.map("",  "<leader>sn", "]s")
u.map("",  "<leader>sp", "[s")
u.map("",  "<leader>sa", "zg")
u.map("",  "<leader>s?", "z=")

-- Misc.
u.map("n", "<localleader>mt", "mmHmt:%s/<C-v><cr>//ge<cr>'tzt'm", { noremap = true })
u.map("n", "<localleader>mm", ":set ff=unix<cr>", { noremap = true })
u.map("",  "<leader>x", ":e ~/buffer.md<cr>")
u.map("",  "<leader>pp", ":setlocal paste!<cr>")
u.map("v", "<C-c>", ":w !xclip -i -sel c<cr><cr>", { noremap = true })
u.map("t", "<Esc", "<C-\\><C-n>", { noremap = true })

-- Command Line
u.map("c", "$h", "e ~/", { noremap = true })
u.map("c", "$d", "e ~/Desktop", { noremap = true })
u.map("c", "$j", "e ./", { noremap = true })

u.map("c", "<C-A>", "<Home>", { noremap = true })
u.map("c", "<C-E>", "<End>", { noremap = true })
u.map("c", "<C-K>", "<C-U>", { noremap = true })
u.map("c", "<C-P>", "<Up>", { noremap = true })
u.map("c", "<C-N>", "<Down>", { noremap = true })

-- Line movement
u.map("n", "<C-k>", ":<C-U>exec \"exec 'norm m`' | move -\" . (1+v:count1)<cr>", { noremap = true })
u.map("n", "<C-j>", ":<C-U>exec \"exec 'norm m`' | move +\" . (0+v:count1)<cr>", { noremap = true })

u.map("v", "<C-k>", ":<C-U>exec \"'<,'>move '<-\" . (1+v:count1)<cr>gv", { noremap = true })
u.map("v", "<C-j>", ":<C-U>exec \"'<,'>move '>+\" . (0+v:count1)<cr>gv", { noremap = true })
