return {
  "lukas-reineke/indent-blankline.nvim",
  tag = "v2.20.8",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = function()
    local interface = require("minimal.utils.interface")

    local colors = interface.colors.get()

    local indent_blankline = require("indent_blankline")

    vim.g.indent_blankline_filetype_exclude = {
      "norg",
      "help",
      "undotree",
      "neo-tree",
    }
    vim.cmd("highlight IndentBlanklineIndent guifg=" .. colors.fg .. " gui=nocombine")

    indent_blankline.setup({
      show_trailing_blankline_indent = false,
      show_current_context_start = false,
      show_current_context = true,
      show_end_of_line = true,
      char = "┊",
      char_highlight_list = {
        "IndentBlanklineIndent",
      },
    })
  end,
}
