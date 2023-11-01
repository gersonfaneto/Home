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
      icons = false,
    })

    require("core.after.mappings.trouble")
  end,
}
