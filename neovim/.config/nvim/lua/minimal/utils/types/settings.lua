---@class Settings
local M = {}

---The `Theme` to be loaded and configured on startup.
---Default: `Gruvbox-Material` with the dark background.
---@type Theme
M.theme = {
  priority = false,
  background = "dark",
  colorscheme = "Gruvbox-Material"
}
---Set to `false` to enable enhanced UI features provided by plugins like `folke/noice.nvim`.
---@type boolean
M.enhanced_ui = true
---Set to `true` to make the background transparent, subject to colorscheme support.
---@type boolean
M.transparent_background = false
---Set to `true` to make the floats transparent.
---@type boolean
M.transparent_floats = false
---Set to `true` to dim inactive windows/splits, subject to colorscheme support.
---@type boolean
M.dim_inactive = false

---Set to `false` to disable the buffer line on the top, listing the active buffers.
---@type boolean
M.show_bufferline = true
---Set to `false` to disable the horizontal line at the current cursor position.
---@type boolean
M.show_cursor_line = true
---Set to `false` to disable the vertical line length limit at the right of the screen.
---@type boolean
M.show_color_column = true
---The limit number of characters by line, `show_color_column` must be set `true`.
---@type string
M.color_column = "100"

---Set to `true` to automatically save files while editing.
---@type boolean
M.auto_save = false
---Set to `true` to restore the last position of the cursor on the buffer.
---@type boolean
M.auto_restore_cursor_position = false
---Set to `true` to automatically remove new comments when jumping to a new line.
---@type boolean
M.auto_remove_new_lines_comment = false

---Set to `true` to enable inlay hints, provided by `lvimuser/lsp-inlayhints.nvim`.
---@type boolean
M.inlay_hints = false
---Set to `true` to enable `virtual_text`, for displaying diagnostics inline.
---@type boolean
M.virtual_text = false
---Set to `true` to enable formatting files when saved, provided by `nvimtools/none-ls.nvim`.
---@type boolean
M.format_on_save = false
---Set to `true` to enable A.I. enhanced coding features, provided by `zbirenbaum/copilot.lua`.
---@type boolean
M.enhanced_coding = false

---Set to `true` to enable DB tools, provided by `kndndrj/nvim-dbee`.
---@type boolean
M.db_tools = false
---set to `true` to enable HTTP tools, provided by `rest-nvim/rest.nvim`.
---@type boolean
M.http_tools = false

return require("minimal.utils.base.settings").extend_settings(M, "custom.settings")
