local M = {
  "sainnhe/gruvbox-material",
  priority = 1000,
}

function M.config()
  local colors = utils.interface.colors.get_colors()
  local background = utils.interface.colors.get_background()

  vim.g.gruvbox_material_foreground = utils.types.settings.material_foreground
  vim.g.gruvbox_material_background = utils.types.settings.material_background

  vim.g.gruvbox_material_ui_contrast = "high"
  vim.g.gruvbox_material_float_style = "dim"

  vim.g.gruvbox_material_transparent_background = utils.types.settings.transparent_background and 2 or 0

  vim.g.gruvbox_material_dim_inactive_windows = utils.types.settings.dim_inactive and 1 or 0

  vim.g.gruvbox_material_enable_bold = 1
  vim.g.gruvbox_material_enable_italic = 1

  vim.g.gruvbox_material_colors_override = {
    bg0 = { colors.bg, "234" },
  }

  vim.cmd("set background=" .. background)
  vim.cmd("colorscheme gruvbox-material")
end

return M
