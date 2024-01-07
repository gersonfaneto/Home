local M = {
  "LunarVim/breadcrumbs.nvim",
  event = { "LspAttach" },
}

function M.config()
  local breadcrumbs = require("breadcrumbs")

  breadcrumbs.setup()
end

return M
