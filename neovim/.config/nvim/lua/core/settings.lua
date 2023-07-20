---@diagnostic disable: undefined-global

local M = {
  -- UI.
  transparent = true,
  float_border = true,
  dim_inactive = false,
  show_cursor_line = false,

  -- Editor.
  auto_save = true,
  auto_restore_cursor_position = true,
  auto_remove_new_lines_comment = true,

  -- LSP.
  inlay_hints = false,
  format_on_save = false,
}

return M
