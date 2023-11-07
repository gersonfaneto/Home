local types = require("minimal.utils.types")

local override = types.settings.transparent_background and "transparent" or "dark"

local tokyo_night = require("tokyonight")

local M = {}

tokyo_night.setup({
  style = "storm",
  light_style = "day",
  transparent = types.settings.transparent_background,
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
  dim_inactive = types.settings.dim_inactive,
  lualine_bold = false,
})

vim.cmd("colorscheme tokyonight")

return M
