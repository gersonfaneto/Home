local groupID = vim.api.nvim_create_augroup("custom_highlights_everforest", {})
local colors = require("core.colors").get_colors()
local settings = require("core.settings")

local M = {}

function M.before()
  local bg = settings.transparent and "NONE" or colors.bg

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = groupID,
    pattern = "everforest",
    command = "hi NormalFloat guibg=" .. bg .. "|" .. "hi FloatBorder guibg=" .. bg,
  })
end

function M.load()
  vim.g.everforest_background = "hard"

  vim.g.everforest_transparent_background = 2 and settings.transparent or 0
  vim.g.everforest_dim_inactive_windows = 1 and settings.dim_inactive or 0

  vim.g.everforest_enable_bold = 1
  vim.g.everforest_enable_italic = 1

  vim.g.everforest_diagnostic_text_highlight = 1
  vim.g.everforest_diagnostic_virtual_text = "colored"
end

function M.after() end

return M
