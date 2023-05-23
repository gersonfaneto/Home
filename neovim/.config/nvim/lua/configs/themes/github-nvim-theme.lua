local settings = require("core.settings")

local M = {
  requires = {
    "github-theme",
  },
}

function M.before() end

function M.load()
  M.github_theme.setup({
    theme_style = "dark_default",
    transparent = settings.transparent,
  })
end

function M.after() end

return M
