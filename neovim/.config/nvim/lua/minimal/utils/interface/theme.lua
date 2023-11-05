---@class Theme
---@field override? boolean @ When set to `true` the theme will be loaded even if the `CURRENT_THEME` environment variable is set.
---@field background? "dark" | "light" @ The variant of the theme to be loaded, defaults to the `dark` if not set.
---@field colorscheme "Gruvbox-Material"|"Catppuccin"|"Decay-Green"|"Everforest"|"Rose-Pine"|"Tokyo-Night" @ The theme to be loaded.

local types = require("minimal.utils.types")

local M = {}

---Returns the current theme name based on the environment variable `CURRENT_THEME`.
---If the variable isn't set the `default_theme` from `Settings` is used.
---@return Theme theme The current loaded theme.
function M.get()
  local colorscheme = types.settings.colorscheme
  local current_theme = os.getenv("CURRENT_THEME")

  if current_theme == nil or #current_theme == 0 or colorscheme.override then
    return colorscheme
  end

  local theme = {
    colorscheme = current_theme,
    background = colorscheme.background,
  }

  -- FIX: This could be better... - 11.05.2023:
  if theme == "Decay-Green" then
    theme = {
      background = colorscheme.background,
      colorscheme = "Decay",
    }
  end
  if theme == "Catppuccin-Latte" then
    theme = {
      background = "light",
      colorscheme = "Catppuccin",
    }
  end
  if theme == "Catppuccin-Mocha" then
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

  require("minimal.core.after.colorschemes." .. theme.colorscheme)
end

return M
