---@class Settings
local M = {}

---@type boolean
M.dim_inactive = false
---@type "soft" | "medium" | "hard"
M.material_background = "hard"
---@type "original" | "material" | "mix"
M.material_foreground = "material"
---@type boolean
M.transparent_background = false

---@type boolean
M.show_cursor_line = true
---@type boolean
M.show_color_column = true
---@type string | string[]
M.color_column = "100"

---@type boolean
M.auto_save = false
---@type boolean
M.auto_restore_cursor_position = false
---@type boolean
M.auto_remove_new_lines_comment = false

---@type boolean
M.inlay_hints = false
---@type boolean
M.virtual_text = true
---@type boolean
M.format_on_save = false
---@type boolean
M.enhanced_coding = true

return require("minimal.utils.base.settings").extend_settings(M, "custom.settings")
