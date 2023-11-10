local types = require("minimal.utils.types")

local catppuccin = require("catppuccin")

local M = {}

catppuccin.setup({
  background = {
    light = "latte",
    dark = "mocha",
  },
  dim_inactive = {
    enabled = types.settings.dim_inactive,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = types.settings.transparent_background,
})

vim.cmd("colorscheme catppuccin")

return M