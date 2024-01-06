local M = {}

M["Gruvbox-Material"] = {
  light = {
    fg = "#928374",
    bg = "#FBF1C7",
  },
  dark = {
    fg = "#7C7D83",
    bg = "#1D2022",
  },
}

function M.get()
  local colors = os.getenv("COLORSCHEME")
  local background = os.getenv("BACKGROUND")

  return vim.tbl_get(M[colors], background)
end

return M
