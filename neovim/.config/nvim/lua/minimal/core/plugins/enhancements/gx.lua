local M = {
  "chrishrb/gx.nvim",
  keys = { "gx" },
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local gx = require("gx")

  gx.setup({})
end

return M
