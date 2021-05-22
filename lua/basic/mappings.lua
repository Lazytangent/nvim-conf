local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Universal
u.map("", "Q", "gq")

-- Normal Mode
u.map("n", "<localleader>w", ":w<cr>", { noremap = true })
u.map("n", "<leader>wq", ":wq<cr>", { noremap = true })
u.map("n", "<leader>q", ":q<cr>", { noremap = true })
u.map("n", "<leader>q", ":q<cr>", { noremap = true })
u.map("n", "<leader>Q", ":q!<cr>", { noremap = true })

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

-- Vim-Test
u.map("n", "t<C-n>", ":TestNearest<cr>", { silent = true })
u.map("n", "t<C-f>", ":TestFile<cr>", { silent = true })
u.map("n", "t<C-s>", ":TestSuite<cr>", { silent = true })
u.map("n", "t<C-l>", ":TestLast<cr>", { silent = true })
u.map("n", "t<C-g>", ":TestVisit<cr>", { silent = true })

-- NERDTree
u.map("", "<leader>nn", ":NERDTreeToggle<cr>")
u.map("", "<leader>nb", ":NERDTreeFromBookmark<Space>")
u.map("", "<leader>nf", ":NERDTreeFind<cr>")
u.map("n", "<leader>nm", ":NERDTreeFocus<cr>", { noremap = true })

-- Vim-TailwindCSS
u.map("n", "<leader>tw", ":set completefunc=tailwind#complete<cr>")

-- Vim-Coc
u.map("n", "[r", "<Plug>(coc-diagnostic-prev)", { silent = true })
u.map("n", "]r", "<Plug>(coc-diagnostic-next)", { silent = true })
u.map("n", "<leader>gd", "<Plug>(coc-definition)", { silent = true })
u.map("n", "<leader>gy", "<Plug>(coc-type-definition)", { silent = true })
u.map("n", "<leader>gi", "<Plug>(coc-implementation)", { silent = true })
u.map("n", "<leader>gr", "<Plug>(coc-references)", { silent = true })
u.map("n", "<localleader>d", ":<C-u>CocList diagnostics<cr>", { noremap = true, silent = true })
u.map("n", "<localleader>c", ":<C-u>CocList commands<cr>", { noremap = true, silent = true })

-- Vim-Ale
u.map("n", "<leader>aF", ":ALEFix<cr>", { noremap = true })
u.map("n", "<leader>aI", ":ALEInfo<cr>", { noremap = true })

-- FZF
u.map("n", "<C-p>", ":FZF<cr>", { noremap = true })

-- Vim-Fugitive
u.map("n", "<leader>gs", ":Git<cr>", { noremap = true })
u.map("n", "<leader>gw", ":Gw<cr>", { noremap = true })
u.map("n", "<leader>gc", ":Git commit<cr>", { noremap = true })
u.map("n", "<leader>gp", ":Git push<cr>", { noremap = true })
u.map("n", "<leader>gl", ":Git pull<cr>", { noremap = true })

-- Visual Mode Selection
u.map("v", "*", ":<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>", { silent = true, noremap = true })
u.map("v", "#", ":<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>", { silent = true, noremap = true })

-- Moving around tabs, windows, and buffers
u.map("", "<leader><cr>", ":noh<cr>", { silent = true })

u.map("", "<leader>ba", [[:%bd|e#|bd#<cr>]])
u.map("", "<leader>l", [[:bnext<cr>]])
u.map("", "<leader>h", [[:bprevious<cr>]])

u.map("", "<leader>tn", ":tabnew<cr>")
u.map("", "<leader>to", ":tabonly<cr>")
u.map("", "<leader>tc", ":tabclose<cr>")
u.map("", "<leader>tm", ":tabmove<cr>")
u.map("", "<leader>tr", ":tabonly<cr>")

u.map("", "<leader>te", [[:tabedit <C-r>=expand("%:p:h")<cr>/]])
u.map("", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

-- Spell Checking
u.map("", "<leader>ss", ":setlocal spell!<cr>")
u.map("", "<leader>sn", "]s")
u.map("", "<leader>sp", "[s")
u.map("", "<leader>sa", "zg")
u.map("", "<leader>s?", "z=")

-- Misc.
u.map("n", "<leader>m", "mmHmt:%s/<C-v><cr>//ge<cr>'tzt'm", { noremap = true })
u.map("n", "<leader>mm", ":set ff=unix<cr>", { noremap = true })
u.map("", "<leader>x", ":e ~/buffer.md<cr>")
u.map("", "<leader>pp", ":setlocal paste!<cr>")
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
