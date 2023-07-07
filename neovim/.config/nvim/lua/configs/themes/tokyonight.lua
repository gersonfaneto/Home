local settings = require("core.settings")

local override = settings.transparent and "transparent" or "dark"

local M = {
  requires = {
    "tokyonight",
  },
}

function M.before() end

function M.load()
  M.tokyonight.setup({
    style = "night",
    light_style = "day",
    transparent = settings.transparent,
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
    dim_inactive = settings.dim_inactive,
    lualine_bold = false,
  })
end

function M.after()
  vim.cmd("colorscheme tokyonight")
end

return M
