local base = require("utils.base")

local override = base.settings.get_settings("transparent") and "transparent" or "dark"

local tokyo_night = require("tokyonight")

local M = {}

tokyo_night.setup({
  style = "night",
  light_style = "day",
  transparent = base.settings.get_settings("transparent"),
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = override,
    floats = override,
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = base.settings.get_settings("dim_inactive"),
  lualine_bold = false,
})

return M
