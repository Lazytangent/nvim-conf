return {
  {
    "nvim-orgmode/orgmode.nvim",
    opts = {
      org_adapt_indentation = false,
      org_agenda_files = {'~/Documents/org/*', '~/.local/src/org/*'},
      org_agenda_skip_deadline_if_done = true,
      org_agenda_skip_scheduled_if_done = true,
      org_agenda_span = 10,
      org_agenda_start_day = '+0d',
      org_default_notes_file = '~/.local/src/org/default.org',
      org_hide_emphasis_markers = true,
      org_highlight_latex_and_related = "entities",
      org_src_window_setup = "botright new",
      org_startup_folded = 'showeverything',
      org_todo_keywords = {
        'TODO(t)', 'PROJ(p)', 'IN-PROGRESS(i)',
        '|',
        'DONE(d)',
      },
      org_todo_keyword_faces = {
        ['IN-PROGRESS'] = ':foreground blue :background #fefefe :weight bold',
        PROJ = ':background #FFFFFF :slant italic :underline on',
        DONE = ':foreground #00ff00',
      },
      emacs_config = {
        config_path = "$HOME/.config/emacs/init.el",
      },
      mappings = {
        org = {
          org_todo = { "cit", "<localleader>mtt" },
          org_todo_prev = { "cit", "<localleader>mtd" },
          org_meta_return = { "<leader><cr>", "<C-CR>" },
        },
      },
      win_split_mode = '40split',
    }
  },
  {
    'chipsenkbeil/org-roam.nvim',
    opts = {
      directory = "~/.local/src/org/",
    },
    lazy = true,
    cmd = {
      "RoamUpdate",
      "RoamSave",
      "RoamToday",
    },
  },
}
