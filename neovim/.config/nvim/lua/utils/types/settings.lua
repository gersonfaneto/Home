local M = {}

-- Make the background transparent, subject to theme support.
M.transparent = true
-- Make the boarder visible/invisible.
M.float_border = true
-- Dim inactive window/split, subject to theme support.
M.dim_inactive = true

-- Toggle a buffer line on the top, listing the active buffers.
M.show_bufferline = false
-- Display a horizontal line on the current cursor position.
M.show_cursor_line = true
-- Show a vertical line to limit the line length.
M.show_color_column = true
-- The number of characters by line, `show_color_column` must be set `true`.
M.color_column = "100"

-- Automatically save the current buffer.
M.auto_save = false
-- Restore the last position of the cursor on the buffer.
M.auto_restore_cursor_position = false
-- Automatically remove new comments when jumping to a new line.
M.auto_remove_new_lines_comment = false

-- Toggle `inlay_hints`, subject to active `LSP` support.
M.inlay_hints = false
-- Toggle `virtual_text`, displaying diagnostics inline.
M.virtual_text = true
-- Automatically format the buffer when saved, subject to active `LSP` support.
M.format_on_save = false

-- Enable Discord Rich Presence.
M.discord_presence = false

return M
