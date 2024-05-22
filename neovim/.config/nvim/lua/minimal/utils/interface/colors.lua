-- NOTE: These are based on `sainnhe/gruvbox-material` with some tweaks.

local M = {
  colors = {
    light = {
      fg = "#928374",
      bg = "#FBF1C7",
      accent = "#E1A345",
    },
    dark = {
      fg = "#7C7D83",
      bg = "#121212",
      accent = "#E1A345",
    },
  },
}

---Returns the background color.
---@return string
function M.get_background()
  local background = os.getenv("BACKGROUND")

  if background == nil then
    background = "dark"
  else
    background = string.lower(tostring(background))
  end

  return background
end

---Returns a table with the `fg`, `bg` and `accent` colors, based on
---the current background.
---@return table<string, string>
function M.get_colors()
  local background = M.get_background()

  return vim.tbl_get(M.colors, background)
end

return M
