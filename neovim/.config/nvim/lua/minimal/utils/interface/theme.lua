---@class Theme
---@field override? boolean @ When set to `true`, `background` and `colorscheme` will be used over their respective environment variables.
---@field background? "dark" | "light" @ The variant of the colorscheme to be loaded.
---@field colorscheme "Catppuccin"|"Decay"|"Everforest"|"Gruvbox-Material"|"Rose-Pine"|"Tokyo-Night" @ The colorscheme to be loaded.

local types = require("minimal.utils.types")

local M = {}

---Returns the current `Theme` with the `colorscheme` and `background` based on their respective
---environment variables. If the variables aren't set, the default values from `Settings` are used.
---@return Theme theme The `Theme` to be loaded.
function M.get()
  local colorscheme = os.getenv("COLORSCHEME")
  local background = os.getenv("BACKGROUND")

  if colorscheme == nil or types.settings.theme.override then
    colorscheme = types.settings.theme.colorscheme
  end

  if background == nil or types.settings.theme.override then
    background = types.settings.theme.background
  end

  local theme = {
    colorscheme = colorscheme,
    background = background,
  }

  return theme
end

---Loads a `Theme`.
---@param theme? Theme @ The `Theme` to be loaded.
function M.set(theme)
  if theme == nil then
    theme = M.get()
  end

  vim.cmd("set background=" .. theme.background)

  require("minimal.core.after.colorschemes." .. theme.colorscheme)
end

return M
