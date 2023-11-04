local types = require("utils.types")
local interface = require("utils.interface")

local colors = interface.get_colors()

local M = {}

vim.g.gruvbox_material_background = "hard"

vim.g.gruvbox_material_transparent_background = 2 and types.settings.transparent or 0

vim.g.gruvbox_material_dim_inactive_windows = 1 and types.settings.dim_inactive or 0

vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1

vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

vim.g.gruvbox_material_colors_override = {
  bg0 = colors.bg,
}

return M
