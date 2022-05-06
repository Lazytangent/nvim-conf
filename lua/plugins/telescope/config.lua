require("telescope").setup({
  defaults = require('telescope.themes').get_ivy({
    file_ignore_patterns = { "^node_modules/" },
    mappings = {
      i = {
        ["<C-u>"] = false,
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
  },
})

require("telescope").load_extension('dap')
require("telescope").load_extension('file_browser')
require("telescope").load_extension('frecency')
require("telescope").load_extension('fzf')
require("telescope").load_extension('lazygit')
require("telescope").load_extension('luasnip')
require("telescope").load_extension('ui-select')
require("telescope").load_extension('yabs')
