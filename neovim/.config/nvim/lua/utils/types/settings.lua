--- Define the standard values for each of the available settings.
--- This module also provides some functions for retrieving said settings.
--- @module 'types.settings'
local M = {}

M.transparent = true
M.float_border = true
M.dim_inactive = true

-- UI elements display settings.
M.show_bufferline = false
M.show_cursor_line = true
M.show_color_column = true
M.color_column = "100"

-- Autosave and restore settings.
M.auto_save = false
M.auto_restore_cursor_position = false
M.auto_remove_new_lines_comment = false

-- Code display settings.
M.inlay_hints = false
M.virtual_text = true
M.format_on_save = false

return M
