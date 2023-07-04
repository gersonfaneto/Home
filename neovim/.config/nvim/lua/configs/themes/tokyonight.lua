local settings = require("core.settings")
local extra_hl = ""

if settings.transparent then
  extra_hl = "transparent"
else
  extra_hl = "dark"
end

local M = {}

function M.before() end

function M.load()
  require("tokyonight").setup({
    style = "night",
    light_style = "day",
    transparent = settings.transparent,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = extra_hl,
      floats = extra_hl,
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
