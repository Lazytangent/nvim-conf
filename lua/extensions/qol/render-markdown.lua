local make_reverse_highlight = function(name)
  local reverse_name = name .. "Reverse"

  if vim.fn.synIDattr(reverse_name, "fg") ~= "" then
    return reverse_name
  end

  local highlight = vim.fn.synIDtrans(vim.fn.hlID(name))
  local gui_bg = vim.fn.synIDattr(highlight, "bg", "gui")
  local cterm_bg = vim.fn.synIDattr(highlight, "bg", "cterm")

  if gui_bg == "" then
    gui_bg = "None"
  end
  if cterm_bg == "" then
    cterm_bg = "None"
  end

  vim.cmd(string.format("highlight %s guifg=%s ctermfg=%s", reverse_name, gui_bg or "None", cterm_bg or "None"))
  return reverse_name
end

local org_query = nil

local function parse_org(ctx)
  if not org_query then
    org_query = vim.treesitter.query.parse(
      "org",
      [[
        (headline (stars) @headline)

        (section (headline)
                 (body) @body)

        (
          (expr) @dash
          (#match? @dash "^-----+$")
        )

        (block
          name: (expr) @_name
          (#match? @_name "(SRC|src)")
        ) @codeblock

        (paragraph . (expr) @quote
        (#eq? @quote ">"))
      ]]
    )
  end
  local marks = {}
  local dash_highlight = "Dash"
  local dash_string = "-"
  local quote_highlight = "Quote"
  local quote_string = "┃"
  local doubledash_highlight = "DoubleDash"
  local doubledash_string = "="
  local codeblock_highlight = "CodeBlock"
  local bullets = { "◉", "○", "✸", "✿" }
  local headline_highlights = { "Headline" }
  local fat_headlines = false
  local fat_headline_upper_string = "▃"
  local fat_headline_lower_string = "🬂"
  local last_fat_headline = -1

  local bullet_highlights = {
    "@org.headline.level1",
    "@org.headline.level2",
    "@org.headline.level3",
    "@org.headline.level4",
    "@org.headline.level5",
    "@org.headline.level6",
    "@org.headline.level7",
    "@org.headline.level8",
  }

  local width = vim.api.nvim_win_get_width(0)
  local win_view = vim.fn.winsaveview()
  local left_offset = win_view.leftcol
  local left_buf_width = 0
  local level = 0

  for id, node in org_query:iter_captures(ctx.root, ctx.buf) do
    local capture = org_query.captures[id]
    local start_row, start_column, end_row, end_column = node:range()

    if capture == "headline" then
      local get_text_function = vim.treesitter.get_node_text(node, ctx.buf)
      level = #vim.trim(get_text_function)

      local hl_group = headline_highlights[math.min(level, #headline_highlights)]
      local bullet_hl_group = bullet_highlights[math.min(level, #bullet_highlights)]
      local virt_text = {}

      if bullets and #bullets > 0 then
        local bullet = bullets[((level - 1) % #bullets) + 1]
        left_buf_width = (level - 1) * 2
        virt_text[1] = {
          string.rep(" ", left_buf_width) .. bullet,
          { hl_group, bullet_hl_group },
        }
      end

      -- Use ext-marks as overlay to create pretty bullets
      table.insert(marks, {
        start_row = start_row,
        start_col = 0,
        conceal = true,
        opts = {
          -- needs to be higher (renders later) priority than the line
          -- alignment, I think
          priority = 5,
          end_col = 0,
          end_row = start_row + 1,
          hl_group = hl_group,
          virt_text = virt_text,
          virt_text_pos = "overlay",
          hl_eol = true,
        },
      })

      -- -- Correctly align line's content first
      table.insert(marks, {
        start_row = start_row,
        start_col = 0,
        opts = {
          end_col = 0,
          end_row = start_row + 1,
          virt_text = {
            {
              string.rep(" ", level - 1),
              { hl_group, bullet_hl_group },
            }
          },
          virt_text_pos = "inline",
        },
      })

      if fat_headlines then
        local reverse_hl_group = make_reverse_highlight(hl_group)

        local padding_above = { { fat_headline_upper_string:rep(width), reverse_hl_group } }
        if start_row > 0 then
          local line_above = vim.api.nvim_buf_get_lines(ctx.buf, start_row - 1, start_row, false)[1]
          if line_above == "" and start_row - 1 ~= last_fat_headline then
            table.insert(marks, {
              start_row = start_row - 1,
              start_col = 0,
              opts = {
                virt_text = padding_above,
                virt_text_pos = "overlay",
                virt_text_win_col = 0,
                hl_mode = "combine",
              },
            })
          else
            table.insert(marks, {
              start_row = start_row,
              start_col = 0,
              opts = {
                virt_lines_above = true,
                virt_lines = { padding_above },
              },
            })
          end
        end

        local padding_below = { { fat_headline_lower_string:rep(width), reverse_hl_group } }
        local line_below = vim.api.nvim_buf_get_lines(ctx.buf, start_row + 1, start_row + 2, false)[1]
        if line_below == "" then
          table.insert(marks, {
            start_row = start_row + 1,
            start_col = 0,
            opts = {
              virt_text = padding_below,
              virt_text_pos = "overlay",
              virt_text_win_col = 0,
              hl_mode = "combine",
            },
          })
          last_fat_headline = start_row + 1
        else
          table.insert(marks, {
            start_row = start_row,
            start_col = 0,
            {
              virt_lines = { padding_below },
            },
          })
        end
      end
    end

    if capture == "body" then
      local hl_group = headline_highlights[math.min(level, #headline_highlights)]
      local bullet_hl_group = bullet_highlights[math.min(level, #bullet_highlights)]

      local capture_text = vim.treesitter.get_node_text(node, ctx.buf)
      local counter = 0
      for _ in capture_text:gmatch("[^\r\n]+") do
        table.insert(marks, {
          start_row = start_row + counter,
          start_col = 0,
          opts = {
            virt_text = {
              {
                string.rep(" ", left_buf_width + 2),
                { hl_group, bullet_hl_group },
              },
            },
            virt_text_pos = "inline",
          },
        })
        counter = counter + 1
      end

    end

    if capture == "dash" then
      table.insert(marks, {
        start_row = start_row,
        start_col = 0,
        opts = {
          virt_text = { { dash_string:rep(width), dash_highlight } },
          virt_text_pos = "overlay",
          hl_mode = "combine",
        },
      })
    end

    if capture == "doubledash" then
      table.insert(marks, {
        start_row = start_row,
        start_col = 0,
        opts = {
          virt_text = { { doubledash_string:rep(width), doubledash_highlight } },
          virt_text_pos = "overlay",
          hl_mode = "combine",
        },
      })
    end

    if capture == "codeblock" then
      table.insert(marks, {
        start_row = start_row,
        start_col = 0,
        opts = {
          end_col = 0,
          end_row = end_row,
          hl_group = codeblock_highlight,
          hl_eol = true,
        },
      })

      local start_line = vim.api.nvim_buf_get_lines(ctx.buf, start_row, start_row + 1, false)[1]
      local _, padding = start_line:find "^ +"
      local codeblock_padding = math.max((padding or 0) - left_offset, 0)

      if codeblock_padding > 0 then
        for i = start_row, end_row - 1 do
          table.insert(marks, {
            start_row = i,
            start_col = 0,
            opts = {
              virt_text = { { string.rep(" ", codeblock_padding), "Normal" } },
              virt_text_win_col = 0,
              priority = 1,
            },
          })
        end
      end
    end

    if capture == "quote" then
      table.insert(marks, {
        start_row = start_row,
        start_col = start_column,
        opts = {
          virt_text = { { quote_string, quote_highlight } },
          virt_text_pos = "overlay",
          hl_mode = "combine",
        },
      })
    end
  end
  return marks
end

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-orgmode/orgmode',
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.icons',
  },
  opts = {
    enabled = true,
    file_types = {
      'markdown',
      'org',
    },
    -- render_modes = { 'n', 'i', 'c', 'x', 'v' },
    custom_handlers = {
      -- org = {
      --   parse = parse_org,
      -- },
    },
    indent = {
      enabled = true,
    },
    heading = {
      enabled = true,
      sign = false,
    },
    log_level = 'trace',
    overrides = {
      filetype = {
        org = {
          render_modes = true,
        },
      },
    },
  },
}
