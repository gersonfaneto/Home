local base = require("utils.base")

local catppuccin = require("catppuccin")

local M = {}

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  dim_inactive = {
    enabled = base.settings.get_settings("dim_inactive"),
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = base.settings.get_settings("transparent"),
})

return M
