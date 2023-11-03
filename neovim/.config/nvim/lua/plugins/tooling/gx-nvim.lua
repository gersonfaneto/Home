return {
  "chrishrb/gx.nvim",
  event = { "BufEnter" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local gx = require("gx")

    gx.setup({})
  end,
}
