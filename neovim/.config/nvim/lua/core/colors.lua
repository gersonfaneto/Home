local M = {}

M.colors = {
  ["Catppuccin-Mocha"] = {
    fg = "#CDD6F4",
    bg = "#1E1E2E,",
  },
  ["Catppuccin-Latte"] = {
    fg = "#4C4F69",
    bg = "#EFF1F5",
  },
  ["Decay-Green"] = {
    fg = "#B1CCC9",
    bg = "#171B20",
  },
  ["Everforest"] = {
    fg = "#D3C6AA",
    bg = "#1E2326",
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
  ["Material-Sakura"] = {
    fg = "#575279",
    bg = "#FAF4ED",
  },
}

M.get_colors = function()
  local current_theme = os.getenv("CURRENT_THEME")

  return M.colors[current_theme] or M.colors["Gruvbox-Material"]
end

return M
