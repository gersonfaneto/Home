local types = require("utils.types")

local current_theme = os.getenv("CURRENT_THEME")

local M = {}

M.themes = {
  ["Catppuccin-Mocha"] = function()
    require("themes.catppuccin")
    vim.cmd("silent colorscheme catppuccin-mocha")
  end,
  ["Catppuccin-Latte"] = function()
    require("themes.catppuccin")
    vim.cmd("silent set background=light")
    vim.cmd("silent colorscheme catppuccin-latte")
  end,
  ["Decay-Green"] = function()
    require("themes.decay")
  end,
  ["Everforest"] = function()
    require("themes.everforest")
    vim.cmd("colorscheme everforest")
  end,
  ["Gruvbox-Material"] = function()
    require("themes.gruvbox-material")
    vim.cmd("colorscheme gruvbox-material")
  end,
  ["Rose-Pine"] = function()
    require("themes.rose-pine")
    vim.cmd("colorscheme rose-pine")
  end,
  ["Tokyo-Night"] = function()
    require("themes.tokyo-night")
    vim.cmd("colorscheme tokyonight")
  end,
}

if current_theme == nil or M.themes[current_theme] == nil then
  M.themes[types.settings.default_colorscheme]()
else
  M.themes[current_theme]()
end

return M
