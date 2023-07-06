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
    transparent_background = settings.transparent,
    dim_inactive = {
      enabled = settings.dim_inactive,
      shade = "dark",
      percentage = 0.15,
    },
  })
end

function M.after()
  vim.cmd("colorscheme catppuccin")
end

return M
