return {
  "chrishrb/gx.nvim",
  event = { "VeryLazy" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local gx = require("gx")

    gx.setup({})
  end,
}
