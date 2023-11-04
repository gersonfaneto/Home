local M = {}

local colors = {
  ["Catppuccin-Mocha"] = {
    fg = "#CDD6F4",
    bg = "#1E1E2E",
  },
  ["Catppuccin-Latte"] = {
    fg = "#4C4F69",
    bg = "#EFF1F5",
  },
  ["Decay-Green"] = {
    fg = "#B1CCC9",
    bg = "#0D0F18",
  },
  ["Everforest"] = {
    fg = "#D3C6AA",
    bg = "#272E33",
  },
  ["Gruvbox-Material"] = {
    fg = "#7C7D83",
    bg = "#1D2021",
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

---Returns a table with the colors values for a given theme, based on a specific environment
---variable. If the variable isn't set the default theme (Gruvbox-Material) is returned.
---@return table colors The ta
function M.get()
  local current_theme = os.getenv("CURRENT_THEME")

  return colors[current_theme] or colors["Gruvbox-Material"]
end

return M
