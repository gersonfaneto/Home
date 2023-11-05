---@class Color
---@field fg string
---@field bg string

---@class Colors
---@field light Color
---@field dark Color
local M = {}

M["Catppuccin"] = {
  light = {
    fg = "#4C4F69",
    bg = "#EFF1F5",
  },
  dark = {
    fg = "#CDD6F4",
    bg = "#1E1E2E",
  },
}

M["Decay"] = {
  light = {
    fg = "",
    bg = "",
  },
  dark = {
    fg = "#B1CCC9",
    bg = "#0D0F18",
  },
}

M["Everforest"] = {
  light = {
    fg = "#5C6A72",
    bg = "#FFFBEF",
  },
  dark = {
    fg = "#D3C6AA",
    bg = "#272E33",
  },
}

M["Gruvbox-Material"] = {
  light = {
    fg = "#928374",
    bg = "#FBF1C7",
  },
  dark = {
    fg = "#7C7D83",
    bg = "#1D2022",
  },
}

M["Rose-Pine"] = {
  light = {
    fg = "",
    bg = "",
  },
  dark = {
    fg = "#E0DEF4",
    bg = "#191724",
  },
}

M["Tokyo-Night"] = {
  light = {
    fg = "",
    bg = "",
  },
  dark = {
    fg = "#C0CAF5",
    bg = "#24283B",
  },
}

return M
