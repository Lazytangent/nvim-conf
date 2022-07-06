local telescope = require("telescope")

telescope.setup({
  defaults = require('telescope.themes').get_ivy({
    file_ignore_patterns = { "^node_modules/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-/>"] = require("telescope.actions").which_key,
        ["<M-w>"] = require("telescope.actions").smart_add_to_loclist,
      }
    },
  }),
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            vim.cmd(string.format("silent cd %s", dir))
          end,
          ["c"] = function(prompt_bufnr)
            local cwd = vim.fn.getcwd()
            local Path = require("plenary.path")
            local os_sep = Path.path.sep
            local default = cwd .. os_sep
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            local fb_utils = require("telescope._extensions.file_browser.utils")

            vim.ui.input({ prompt = "Insert the file name:\n", default = default }, function(file)
              if not file then
                return
              end
              if file == "" then
                print "Please enter valid filename!"
                return
              end
              if file == cwd .. os_sep then
                print "Please enter valid file or folder name!"
                return
              end
              file = Path:new(file)

              if file:exists() then
                error "File or folder already exists."
                return
              end
              if not fb_utils.is_dir(file.filename) then
                file:touch { parents = true }
              else
                Path:new(file.filename:sub(1, -2)):mkdir { parents = true }
              end
              current_picker:refresh(finder, { reset_prompt = true })
            end)
          end,
        },
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    workspaces = {
      keep_insert = true,
    },
  },
})

telescope.load_extension('dap')
telescope.load_extension('file_browser')
telescope.load_extension('frecency')
telescope.load_extension('fzf')
telescope.load_extension('lazygit')
telescope.load_extension('live_grep_args')
telescope.load_extension('luasnip')
telescope.load_extension('ui-select')
telescope.load_extension('workspaces')
telescope.load_extension('yabs')
