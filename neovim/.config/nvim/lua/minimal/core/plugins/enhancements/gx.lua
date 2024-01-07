local M = {
  "chrishrb/gx.nvim",
  event = { "VeryLazy" },
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local gx = require("gx")

  gx.setup({})
end

return M
