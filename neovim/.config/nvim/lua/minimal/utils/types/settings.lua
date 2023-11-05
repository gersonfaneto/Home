---@class Settings
local M = {}

---The colorscheme to be loaded and configured on startup.
---@type Theme
M.colorscheme = {
  priority = false,
  background = "dark",
  colorscheme = "Gruvbox-Material"
}
---Toggle enhanced UI features provided by plugins like `folke/noice.nvim`.
---@type boolean
M.enhanced_ui = true
---Make the background transparent, subject to theme support.
---@type boolean
M.transparent = false
---Make the boarder visible/invisible.
---@type boolean
M.float_border = true
---Dim inactive window/split, subject to theme support.
---@type boolean
M.dim_inactive = false

---Toggle a buffer line on the top, listing the active buffers.
---@type boolean
M.show_bufferline = true
---Display a horizontal line on the current cursor position.
---@type boolean
M.show_cursor_line = true
---Show a vertical line to limit the line length.
---@type boolean
M.show_color_column = true
---The number of characters by line, `show_color_column` must be set `true`.
---@type string
M.color_column = "100"

---Automatically save the current buffer.
---@type boolean
M.auto_save = true
---Restore the last position of the cursor on the buffer.
---@type boolean
M.auto_restore_cursor_position = true
---Automatically remove new comments when jumping to a new line.
---@type boolean
M.auto_remove_new_lines_comment = true

---Toggle `inlay_hints`, subject to active `LSP` support.
---@type boolean
M.inlay_hints = true
---Toggle `virtual_text`, displaying diagnostics inline.
---@type boolean
M.virtual_text = false
---Automatically format the buffer when saved, subject to active `LSP` support.
---@type boolean
M.format_on_save = false
---Toggle enhanced coding features provided by plugins such as `zbirenbaum/copilot.lua`.
---@type boolean
M.enhanced_coding = true

---Enable Discord Rich Presence.
---@type boolean
M.discord_presence = true
---Enable DB tools.
---@type boolean
M.db_tools = true
---Enable REST tools.
---@type boolean
M.http_tools = true

return require("minimal.utils.base.settings").extend_settings(M, "custom.settings")
