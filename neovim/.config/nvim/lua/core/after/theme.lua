local current_theme = os.getenv("CURRENT_THEME")

if current_theme == nil then
  vim.cmd("colorscheme gruvbox-material")
  return
end

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

for colorscheme, define in pairs(M.themes) do
  if colorscheme == current_theme then
    define()
    return
  end
end

return M
