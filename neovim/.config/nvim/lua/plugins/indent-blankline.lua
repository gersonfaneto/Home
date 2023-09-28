return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  config = function()
    local colors = require("utils.interface").colors.get_colors()

    vim.g.indent_blankline_filetype_exclude = {
      "help",
      "undotree",
      "neo-tree",
    }
    vim.cmd("highlight IndentBlanklineIndent guifg=" .. colors.fg .. " gui=nocombine")

    require("ibl").setup({
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
