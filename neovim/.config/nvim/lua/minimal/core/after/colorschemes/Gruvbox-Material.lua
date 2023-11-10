local types = require("minimal.utils.types")
local interface = require("minimal.utils.interface")

local colors = interface.colors.get()

local M = {}

vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "hard"

vim.g.gruvbox_material_transparent_background = types.settings.transparent_background and 2 or 0

vim.g.gruvbox_material_dim_inactive_windows = types.settings.dim_inactive and 1 or 0

vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1

vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

vim.g.gruvbox_material_colors_override = {
  bg0 = { colors.bg, "234" },
}

vim.cmd("colorscheme gruvbox-material")

return M