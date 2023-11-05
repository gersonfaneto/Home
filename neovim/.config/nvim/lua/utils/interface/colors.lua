---@class Color
---@field fg string
---@field bg string

local theme = require("utils.interface.theme")
local settings = require("utils.types.settings")

local current_theme = theme.get()

local M = {}

local colors = {
  ["Catppuccin"] = {
    fg = current_theme.background == "dark" and "#CDD6F4" or "#4C4F69",
    bg = current_theme.background == "dark" and "#1E1E2E" or "#EFF1F5",
  },
  ["Decay"] = {
    fg = "#B1CCC9",
    bg = "#0D0F18",
  },
  ["Everforest"] = {
    fg = current_theme.background == "dark" and "#D3C6AA" or "#5C6A72",
    bg = current_theme.background == "dark" and "#272E33" or "#FFFBEF",
  },
  ["Gruvbox-Material"] = {
    fg = current_theme.background == "dark" and "#7C7D83" or "#A9B1D6",
    bg = current_theme.background == "dark" and "#1D2022" or "#F9F5D7",
  },
  ["Rose-Pine"] = {
    fg = "#E0DEF4",
    bg = "#191724",
  },
  ["Tokyo-Night"] = {
    fg = "#C0CAF5",
    bg = "#24283B",
  },
}

---Returns a table with the `bg` and `fg` color values for the current theme.
---@return Color color The table with the corresponding colors.
function M.get()
  local color = colors[current_theme.colorscheme]

  if settings.transparent then
    color.bg = "NONE"
  end

  return color
end

return M
