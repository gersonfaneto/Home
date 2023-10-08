local types = require("utils.types")

local catppuccin = require("catppuccin")

local M = {}

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  dim_inactive = {
    enabled = types.get_settings("dim_inactive"),
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = types.get_settings("transparent"),
})

return M
