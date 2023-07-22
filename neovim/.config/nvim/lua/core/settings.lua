---@diagnostic disable: undefined-global

local M = {
  -- UI.
  transparent = true,
  float_border = true,
  dim_inactive = false,
  show_cursor_line = true,
  show_color_column = false,

  -- Editor.
  auto_save = true,
  auto_restore_cursor_position = false,
  auto_remove_new_lines_comment = true,

  -- LSP.
  inlay_hints = true,
  virtual_text = false,
  format_on_save = false,
}

return M
