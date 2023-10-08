local icons = require("utils.interface.icons")
local colors = require("utils.interface.colors")

local M = {}

--- Returns a table with the colors values for a given theme, based on a specific enviroment
--- variable. If the variable isn't set the default theme (Gruvbox-Material) is returned.
--- @return table colors The tbale with the proper color values.
M.get_colors = function()
  local current_theme = os.getenv("CURRENT_THEME")

  return colors[current_theme] or colors["Gruvbox-Material"]
end

--- Returns a table of a given icon category.
--- @param category string The category of the desired icons.
--- @return table icons The sub table of the given category.
M.get_icons = function(category)
  local table = vim.tbl_get(icons, category)

  if table == nil then
    return {}
  end

  return table
end

--- Returns an icon given it's name and category.
--- @param category string The category of the desired icon.
--- @param name string The name of the desired icon.
--- @return string icon The requested icon.
M.get_icon = function(category, name)
  local table = M.get_icons(category)

  if vim.tbl_isempty(table) then
    return ""
  end

  local icon = vim.tbl_get(table, name)

  if icon == nil then
    return ""
  end

  return icon
end

return M
