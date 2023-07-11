local groupID = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})

local colors = require("core.colors").get_colors()
local settings = require("core.settings")

local M = {}

function M.before()
  local bg = settings.transparent and "NONE" or colors.bg

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = groupID,
    pattern = "gruvbox-material",
    command = "hi NormalFloat guibg=" .. bg .. "|" .. "hi FloatBorder guibg=" .. bg,
  })
end

function M.load()
  vim.g.gruvbox_material_background = "hard"

  vim.g.gruvbox_material_transparent_background = 2 and settings.transparent or 0

  vim.g.gruvbox_material_dim_inactive_windows = 1 and settings.dim_inactive or 0

  vim.g.gruvbox_material_enable_bold = 1
  vim.g.gruvbox_material_enable_italic = 1

  vim.g.gruvbox_material_diagnostic_text_highlight = 1
  vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

  vim.g.gruvbox_material_colors_override = {
    bg0 = colors.bg,
  }
end

function M.after() end

return M
