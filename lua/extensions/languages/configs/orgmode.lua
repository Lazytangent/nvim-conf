local orgmode = require('orgmode')

orgmode.setup {
  org_adapt_indentation = false,
  org_agenda_files = {'~/Documents/org/*', '~/.local/src/org/*'},
  org_agenda_skip_deadline_if_done = true,
  org_agenda_skip_scheduled_if_done = true,
  org_default_notes_file = '~/.local/src/org/default.org',
  org_hide_emphasis_markers = true,
  org_highlight_latex_and_related = "entities",
  org_src_window_setup = "botright new",
  org_startup_folded = 'showeverything',
  org_todo_keywords = {
    'TODO(t)', 'PROJ(p)',
    '|',
    'DONE(d)',
  },
  emacs_config = {
    config_path = "$HOME/.config/emacs/init.el",
  },
  mappings = {
    org = {
      org_todo = { "cit", "<localleader>mtt" },
      org_todo_prev = { "cit", "<localleader>mtd" },
    },
  },
}
