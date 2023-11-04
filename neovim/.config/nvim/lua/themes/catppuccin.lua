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
    enabled = types.settings.dim_inactive,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = types.settings.transparent,
})

return M
