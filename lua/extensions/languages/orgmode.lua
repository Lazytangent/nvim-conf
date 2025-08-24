---@param path string
local function org_files(path)
  local org_directory = "~/.local/src/org"
  return ('%s/%s'):format(org_directory, path)
end

return {
  {
    "nvim-orgmode/orgmode",
    opts = {
      org_adapt_indentation = false,
      -- org_startup_indented = true,
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
      extensions = {
        dailies = {
          bindings = {
            goto_today = "<localleader>nd.",
          },
          templates = {
            d = {
              description = "Default",
              template = "%?",
              target = "%<%Y-%m-%d>.org",
            },
            w = {
              description = "Work Days",
              template = {
                "* Work Items :work:",
                "** Tickets :tickets:",
                "- %?",
                "** Meetings :meetings:",
                "** Tangential Stuff",
                "** Stand-up",
                "** PR Reviews",
                "** Documentation Reviews",
                "** PD/NR Alerts :pd:nr:",
                "* Non-Work Items",
              },
              target = "%<%Y-%m-%d>.org",
            },
            n = {
              description = "Non-work days",
              template = "%?",
              target = "%<%Y-%m-%d>.org",
            },
          },
        },
      },
      templates = {
        -- Templates already come with the headline based on the title
        d = {
          description = "Default",
          template = "%?",
          target = org_files("%<%Y%m%d%H%M%S>-%[slug].org"),
        },
        c = {
          description = "Comp-sci",
          template = "%?",
          target = org_files("comp-sci/%<%Y%m%d%H%M%S>-%[slug].org"),
        },
        i = {
          description = "item",
          template = "%?",
          target = org_files("items/%<%Y%m%d%H%M%S>-%[slug].org"),
        },
        b = {
          description = "Browsers",
          q = {
            description = "Qutebrowser",
            template = "%?",
            target = org_files("browsers/qutebrowser/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          l = {
            description = "Lynx",
            template = "%?",
            target = org_files("browsers/lynx/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          f = {
            description = "Firefox",
            template = "%?",
            target = org_files("browsers/firefox%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          a = {
            description = "Arc",
            template = "%?",
            target = org_files("browsers/arc/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
        },
        w = {
          description = "Work Things",
          g = {
            description = "General",
            template = "%?",
            target = org_files("work/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          o = {
            description = "Off-Topic",
            template = "%?",
            target = org_files("work/off-topic/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          t = {
            description = "Tickets",
            template = "%?",
            target = org_files("work/tickets/%[slug].org"),
          },
          p = {
            description = "PR Reviews",
            template = "%?",
            target = org_files("work/pr-reviews/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          m = {
            description = "Meetings",
            template = "%?",
            target = org_files("work/meetings/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
        },
        l = {
          description = "Languages",
          r = {
            description = "Rust",
            template = "%?",
            target = org_files("languages/rust/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          r = {
            description = "Zig",
            template = "%?",
            target = org_files("languages/zig/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          r = {
            description = "TeX",
            template = "%?",
            target = org_files("languages/tex/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          r = {
            description = "Lua",
            template = "%?",
            target = org_files("languages/lua/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
          r = {
            description = "Python",
            template = "%?",
            target = org_files("languages/python/%<%Y%m%d%H%M%S>-%[slug].org"),
          },
        },
      },
    },
    cmd = {
      "RoamUpdate",
      "RoamSave",
      "RoamToday",
      "Roam",
    },
    keys = {
      "<leader>n",
    },
  },
}
