local wk = require('which-key')

wk.register({
  ["<leader>"] = {
    a = {
      name = "+ALE",
      F = { "<cmd>ALEFix", "ALE Fix" },
      I = { "<cmd>ALEInfo", "ALE Info" },
    },
    b = {
      name = "+Buffers",
      a = { "<cmd>%bd|e#|bd#", "Close all other buffers" },
      d = { "<cmd>Bclose<cr>:tabclose<cr>gT", "Close buffers" },
    },
    c = {
      name = "+Change",
      d = { "<cmd>cd %:p:h:pwd", "Change working directory" },
    },
    f = {
      name = "+Telescope",
      b = { "<cmd>Telescope buffers", "Find buffer" },
      f = { "<cmd>Telescope find_files", "Find files" },
      g = { "<cmd>Telescope live_grep", "Grep" },
      h = { "<cmd>Telescope help_tags", "Help" },
    },
    g = {
      name = "+Git and Goto",
      c = { "<cmd>Git commit" },
      d = { "<cmd><Plug>(coc-definition)", "Go to definition" },
      i = { "<cmd><Plug>(coc-implementation)", "Go to implementation" },
      l = { "<cmd>Git pull" },
      p = { "<cmd>Git push" },
      r = { "<cmd><Plug>(coc-references)" },
      w = { "<cmd>Git write" },
      y = { "<cmd><Plug>(coc-type-definition)" },
      s = {
        name = "+Git status",
        t = { "<cmd>Git" },
      },
    },
    n = {
      name = "+NERDTree",
      b = { "<cmd>NERDTreeFromBookmark" },
      f = { "<cmd>NERDTreeFind" },
      m = { "<cmd>NERDTreeFocus" },
      n = { "<cmd>NERDTreeToggle" },
    },
    p = {
      name = "+Prettier and paste",
      p = { "<cmd>setlocal paste!" },
      y = { "<cmd>Prettier", "Run Prettier" },
    },
    r = {
      name = "+r",
      n = {
        name = "+Relative number",
        u = { "<cmd>set relativenumber!" },
      },
    },
    s = {
      name = "+Spell",
      ["?"] = { "<cmd>z=" },
      a = { "<cmd>zg" },
      n = { "<cmd>]s", "Next bad spelling" },
      p = { "<cmd>[s", "Prev bad spelling" },
      s = { "<cmd>setlocal spell!", "Toggle spellcheck" },
    },
    t = {
      name = "+Tabs",
      c = { "<cmd>tabclose", "Close tab" },
      e = { "<cmd>tabedit", "Edit tab" },
      m = { "<cmd>tabmove", "Move tab" },
      n = { "<cmd>tabnew", "New tab" },
      o = { "<cmd>tabonly", "Only tab" },
      w = { "<cmd>set completefunc=tailwind#complete", "Tailwind Complete" },
    },
    u = {
      name = "+Undo Fold",
      f = { "<cmd>zR", "Unfold" },
    },
    ["<CR>"] = { "<cmd>noh", "Turn off highlight" },
    h = { "<cmd>bprevious", "Prev buffer" },
    l = { "<cmd>bnext", "Next buffer" },
    m = { "<cmd>mmHmt:%s/<C-V>//ge'tzt'm", "Timestamp" },
    O = { "<cmd>O<Esc>", "Add new line above" },
    o = { "<cmd>o<Esc>", "Add new line below" },
    q = { "<cmd>q", "Quit" },
    Q = { "<cmd>q!", "Force quit" },
    w = { "<cmd>w", "Write" },
    x = { "<cmd>e ~/buffer.md", "Create markdown buffer" },
  },
})
