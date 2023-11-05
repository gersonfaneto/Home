---@class Theme
---@field background "dark" | "light" @ The background color for the theme.
---@field colorscheme string @ The colorscheme to be loaded.

local settings = require("utils.types.settings")

local M = {}

---Returns the current theme name based on the environment variable `CURRENT_THEME`.
---If the variable isn't set the `default_theme` from `Settings` is used.
---@return Theme theme The current loaded theme.
function M.get()
  local colorscheme = os.getenv("CURRENT_THEME")

  local theme = {
    colorscheme = colorscheme,
    background = settings.default_colorscheme.background,
  }

  if colorscheme == nil or #colorscheme == 0 then
    return settings.default_colorscheme
  end

  -- NOTE: This are very specific to `Archie`... - 11.05.2023:
  if colorscheme == "Decay-Green" then
    theme = {
      background = settings.default_colorscheme.background,
      colorscheme = "Decay",
    }
  end
  if colorscheme == "Catppuccin-Latte" then
    theme = {
      background = "light",
      colorscheme = "Catppuccin",
    }
  end
  if colorscheme == "Catppuccin-Mocha" then
    theme = {
      background = "dark",
      colorscheme = "Catppuccin",
    }
  end

  return theme
end

---@param theme? Theme @ The theme to be loaded.
function M.set(theme)
  if theme == nil then
    theme = M.get()
  end

  vim.cmd("set background=" .. theme.background)

  require("core.after.colorschemes." .. theme.colorscheme)
end

return M
