return {
  "chrishrb/gx.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local gx = require("gx")

    gx.setup({})
  end,
}
