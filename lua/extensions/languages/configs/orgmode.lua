local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup {
  org_agenda_files = {'~/Documents/org/*', '~/.local/src/org/*'},
  org_default_notes_file = '~/.local/src/org/default.org',
  org_indent_mode = 'noindent',
  org_hide_emphasis_markers = true,
  org_highlight_latex_and_related = "entities",
  emacs_config = {
    config_path = "$HOME/.config/emacs/init.el",
  },
  mappings = {
    org = {
      org_todo = "<localleader>mtt",
      org_todo_prev = "<localleader>mtd",
    },
  },
}
