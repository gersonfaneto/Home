local settings = require("core.settings")

local M = {
  requires = {
    "catppuccin",
  },
}

function M.before() end

function M.load()
  require("catppuccin").setup({
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    dim_inactive = {
      enabled = settings.dim_inactive,
      shade = "dark",
      percentage = 0.15,
    },
    transparent_background = settings.transparent,
  })
end

function M.after()
end

return M
