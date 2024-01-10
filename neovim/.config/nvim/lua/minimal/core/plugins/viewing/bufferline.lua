local M = {
  "akinsho/bufferline.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
  local bufferline = require("bufferline")

  local colors = utils.interface.colors.get_colors()

  bufferline.setup({
    options = {
      separator_style = { "", "" },
      indicator = { style = "none" },
      show_tab_indicators = false,
      always_show_bufferline = false,
      show_close_icon = false,
      show_buffer_close_icons = false,
      tab_size = 0,
      max_name_length = 30,
      offsets = {
        {
          filetype = "neo-tree",
          text = "  Project",
          highlight = "Directory",
          text_align = "left",
        },
      },
      modified_icon = "",
    },

    highlights = {
      fill = {
        bg = "",
      },
      background = {
        bg = "",
      },
      tab = {
        bg = "",
      },
      tab_close = {
        bg = "",
      },
      tab_separator = {
        fg = colors.bg,
        bg = "",
      },
      tab_separator_selected = {
        fg = colors.bg,
        bg = "",
        sp = colors.fg,
      },
      close_button = {
        bg = "",
        fg = colors.fg,
      },
      close_button_visible = {
        bg = "",
        fg = colors.fg,
      },
      close_button_selected = {
        fg = { attribute = "fg", highlight = "StatusLineNonText" },
      },
      buffer_visible = {
        bg = "",
      },
      modified = {
        bg = "",
      },
      modified_visible = {
        bg = "",
      },
      duplicate = {
        fg = colors.fg,
        bg = "",
      },
      duplicate_visible = {
        fg = colors.fg,
        bg = "",
      },
      separator = {
        fg = colors.bg,
        bg = "",
      },
      separator_selected = {
        fg = colors.bg,
        bg = "",
      },
      separator_visible = {
        fg = colors.bg,
        bg = "",
      },
      offset_separator = {
        fg = colors.bg,
        bg = "",
      },
    },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-b><C-n>",
    rhs = ":BufferLineCycleNext<CR>",
    description = "Cycle to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-b><C-p>",
    rhs = ":BufferLineCyclePrev<CR>",
    description = "Cycle to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-b><C-l>",
    rhs = ":BufferLineMovePrev<CR>",
    description = "Move current buffer to left.",
  },
  {
    mode = { "n" },
    lhs = "<C-b><C-h>",
    rhs = ":BufferLineMoveNext<CR>",
    description = "Move current buffer to right.",
  },
  {
    mode = { "n" },
    lhs = "<C-b><C-o>",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
    end,
    description = "Close all other buffers.",
  },
  {
    mode = { "n" },
    lhs = "<C-b><C-a>",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
      vim.cmd("BufferDelete")
    end,
    description = "Close all buffers.",
  },
}, { options = { noremap = true, silent = true }, prefix = "BufferLine: " })


return M
