local M = {}

M["Gruvbox-Material"] = {
  light = {
    fg = "#928374",
    bg = "#FBF1C7",
  },
  dark = {
    fg = "#7C7D83",
    bg = "#121212",
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

---Returns a table with the `fg` and `bg` colors, based on the colorscheme
---and background.
---@return table<string, string>
function M.get_colors()
  local colors = os.getenv("COLORSCHEME")
  local background = M.get_background()

  return vim.tbl_get(M[colors], background)
end

return M
