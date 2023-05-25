---@diagnostic disable: undefined-global

local M = {
  requires = {
    "indent_blankline",
  },
}

function M.before()
  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "undotree",
  }
  vim.cmd("highlight IndentBlanklineIndent guifg=#4d5566 gui=nocombine")
end

function M.load()
  M.indent_blankline.setup({
    show_trailing_blankline_indent = false,
    show_current_context_start = false,
    show_current_context = true,
    show_end_of_line = true,
    char = "┊",
    char_highlight_list = {
      "IndentBlanklineIndent",
    },
  })
end

function M.after() end

return M
