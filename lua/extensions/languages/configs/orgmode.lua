local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup {
  org_agenda_files = {'~/Documents/org/*'},
  org_default_notes_file = '~/Documents/org/default.org',
  org_indent_mode = 'noindent',
  mappings = {
    org = {
      org_todo = "<localleader>mtt",
      org_todo_prev = "<localleader>mtd",
    },
  },
}
