return {
  "folke/trouble.nvim",
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleToggle",
    "TroubleRefresh",
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require("trouble")

    trouble.setup({
      auto_fold = true,
      auto_preview = false,
    })
  end,
}
