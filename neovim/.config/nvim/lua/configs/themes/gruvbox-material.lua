local settings = require("core.settings")

local M = {}

function M.before()
end

function M.load()
  vim.g.gruvbox_material_background = "hard"

  if settings.transparent then
    vim.g.gruvbox_material_transparent_background = 2
  end

  if settings.dim_inactive then
    vim.g.gruvbox_material_dim_inactive_windows = 1
  end

  vim.g.gruvbox_material_enable_bold = 1
  vim.g.gruvbox_material_enable_italic = 1

  vim.g.gruvbox_material_diagnostic_text_highlight = 1
  vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
end

function M.after()
  vim.cmd("colorscheme gruvbox-material")
end

return M
