local current_theme = os.getenv("CURRENT_THEME")

if current_theme == nil then
  vim.cmd("colorscheme gruvbox-material")
  return
end

local M = {}

M.themes = {
  ["Catppuccin-Mocha"] = function()
    vim.cmd("silent colorscheme catppuccin-mocha")
  end,
  ["Catppuccin-Latte"] = function()
    vim.cmd("silent set background=light")
    vim.cmd("silent colorscheme catppuccin-latte")
  end,
  ["Decay-Green"] = function()
    vim.cmd("silent colorscheme decay")
  end,
  ["Gruvbox"] = function()
    vim.cmd("silent colorscheme gruvbox-material")
  end,
  ["Material-Sakura"] = function()
    vim.cmd("silent set background=light")
    vim.cmd("silent colorscheme sakura")
  end,
  ["Rose-Pine"] = function()
    vim.cmd("silent colorscheme rose-pine")
  end,
  ["Tokyo-Night"] = function()
    vim.cmd("silent colorscheme tokyonight")
  end,
}

for colorscheme, define in pairs(M.themes) do
  if colorscheme == current_theme then
    define()
    return
  end
end

return M