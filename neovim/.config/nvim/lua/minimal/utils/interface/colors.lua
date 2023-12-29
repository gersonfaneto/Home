local types = require("minimal.utils.types")
local theme = require("minimal.utils.interface.theme")

local M = {}

local current_theme = theme.get()

local hl = types.colors[current_theme.colorscheme]

---Returns a table with the `bg` and `fg` color values for the current theme.
---@return Color color The table with the corresponding colors.
function M.get()
  local color = {
    fg = current_theme.background == "dark" and hl.dark.fg or hl.light.fg,
    bg = current_theme.background == "dark" and hl.dark.bg or hl.light.bg,
  }

  -- NOTE: Do I really need this...? - 12.29.2023: 
  -- if types.settings.transparent_background then
  --   color.bg = "NONE"
  -- end

  return color
end

return M
