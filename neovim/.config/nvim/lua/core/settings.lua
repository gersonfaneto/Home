---@diagnostic disable: undefined-global

local M = {
  -- UI.
  transparent = true,
  float_border = true,
  dim_inactive = true,

  -- UX.
  show_bufferline = false,
  show_cursor_line = true,
  show_color_column = false,
  color_column = "100",

  -- Editor.
  auto_save = false,
  auto_restore_cursor_position = false,
  auto_remove_new_lines_comment = false,

  -- LSP.
  inlay_hints = true,
  virtual_text = true,
  format_on_save = false,
}

return M
