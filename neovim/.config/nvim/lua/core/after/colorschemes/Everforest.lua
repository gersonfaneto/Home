local types = require("utils.types")
local interface = require("utils.interface")

local colors = interface.colors.get()

local M = {}

vim.g.everforest_background = "hard"

vim.g.everforest_transparent_background = types.settings.transparent and 2 or 0

vim.g.everforest_dim_inactive_windows = types.settings.dim_inactive and 1 or 0

vim.g.everforest_enable_bold = 1
vim.g.everforest_enable_italic = 1

vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_virtual_text = "colored"

vim.g.everforest_colors_override = {
  bg0 = { colors.bg, "234" },
}

vim.cmd("colorscheme everforest")

return M
