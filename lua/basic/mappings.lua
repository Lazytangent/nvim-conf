local u = require("utils.core")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Universal
u.map("", "Q", "gq")

-- Normal Mode Save and Quit Commands
u.map("n", "<leader>w", ":w<cr>", { noremap = true })
u.map("n", "<localleader>wq", ":wq<cr>", { noremap = true })
u.map("n", "<leader>q", ":q<cr>", { noremap = true })
u.map("n", "<leader>Q", ":q!<cr>", { noremap = true })

-- Insert Mode Save
u.map("i", "<C-s>", "<Esc>:w<cr>i")

u.map("n", "<localleader>o", "o<Esc>", { noremap = true })
u.map("n", "<localleader>O", "O<Esc>", { noremap = true })

u.map("n", "<localleader>nr", ":set rnu!<cr>", { noremap = true })
u.map("n", "<localleader>nn", ":set nu!<cr>", { noremap = true })

u.map("n", "<localleader>r", ":source ~/.config/nvim/init.lua<cr>", { noremap = true })

u.map("n", "<leader>ct", ":!ctags -R .<cr><cr>", { noremap = true })
u.map("n", "<leader>cd", ":cd %:h<cr>", { noremap = true })

u.map("n", "j", "gj")
u.map("n", "k", "gk")

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

-- Telescope.nvim
u.map("n", "<localleader>cc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")

u.map("n", "<localleader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
u.map("n", "<localleader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>")
u.map("n", "<localleader>fd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>")
u.map("n", "<localleader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
u.map("n", "<localleader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
u.map("n", "<localleader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
u.map("n", "<localleader>fl", "<cmd>lua require('telescope.builtin').loclist()<cr>")
u.map("n", "<localleader>fp", "<cmd>lua require('telescope.builtin').planets()<cr>")
u.map("n", "<localleader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
u.map("n", "<localleader>fr", "<cmd>lua require('telescope.builtin').registers()<cr>")
u.map("n", "<localleader>ft", "<cmd>lua require('telescope.builtin').treesitter()<cr>")

u.map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
u.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
u.map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_status()<cr>")
u.map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
u.map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').tags()<cr>")

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

-- Trouble.nvim
u.map("n", "<localleader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xw", "<cmd>Trouble lsp_workspace_diagnostic<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
u.map("n", "<localleader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
u.map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
