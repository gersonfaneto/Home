---@diagnostic disable: undefined-global

local M = {
  -- Aesthetics.
  transparent = true,
  float_border = true,
  dim_inactive = true,

  -- UI.
  show_bufferline = false,
  show_cursor_line = true,
  color_column = "100",
  show_color_column = true,

  -- Editor.
  auto_save = false,
  auto_restore_cursor_position = false,
  auto_remove_new_lines_comment = false,

  -- LSP.
  inlay_hints = false,
  virtual_text = false,
  format_on_save = false,
}

return M
