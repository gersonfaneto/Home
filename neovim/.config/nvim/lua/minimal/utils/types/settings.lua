---@class Settings
local M = {}

---Set to `true` to dim inactive windows/splits, subject to colorscheme support.
---@type boolean
M.dim_inactive = false
---Based on the options from `sainnhe/gruvbox-material`.
---@type "soft" | "medium" | "hard"
M.material_background = "hard"
---Based on the options from `sainnhe/gruvbox-material`.
---@type "original" | "material" | "mix"
M.material_foreground = "material"
---Set to `true` to make the background transparent, subject to colorscheme support.
---@type boolean
M.transparent_background = false

---Set to `false` to disable the `number` and `relativenumbers` options.
---@type boolean
M.show_line_numbers = true
---Set to `false` to disable the horizontal line at the current cursor position.
---@type boolean
M.show_cursor_line = true
---Set to `false` to disable the vertical line length limit at the right of the screen.
---@type boolean
M.show_color_column = true
---The limit number of characters by line, `show_color_column` must be set `true`.
---@type string | string[]
M.color_column = "100"

---Set to `true` to automatically save files while editing.
---@type boolean
M.auto_save = false
---Set to `false` to disable auto pairing for some characters, provided by `echasnovski/mini.pairs`.
---@type boolean
M.auto_pairs = true
---Set to `true` to restore the last position of the cursor on the buffer.
---@type boolean
M.auto_restore_cursor_position = false
---Set to `true` to automatically remove new comments when jumping to a new line.
---@type boolean
M.auto_remove_new_lines_comment = false

---Set to `true` to enable `virtual_text`, for displaying diagnostics inline.
---@type boolean
M.virtual_text = false
---Set to `false` to disable formatting files when saved, provided by `nvimtools/none-ls.nvim`.
---@type boolean
M.format_on_save = false
---Set to `false` to disable A.I. enhanced coding features, provided by `zbirenbaum/copilot.lua`.
---@type boolean
M.enhanced_coding = true
---Set to `false` to disable auto-completion features, provided by `hrsh7th/nvim-cmp`.
---@type boolean
M.auto_completion = true

---Set to `false` to enable the arrow keys.
---@type boolean
M.full_immersion = true

return require("minimal.utils.base.settings").extend_settings(M, "custom.settings")
