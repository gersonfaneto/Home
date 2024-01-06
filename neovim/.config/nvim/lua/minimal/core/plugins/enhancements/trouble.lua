return {
  "folke/trouble.nvim",
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleToggle",
    "TroubleRefresh",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local trouble = require("trouble")
    local telescope = require("telescope")

    trouble.setup({
      mode = "quickfix",
    })

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["<C-q>"] = trouble.smart_open_with_trouble,
          },
          i = {
            ["<C-q>"] = trouble.smart_open_with_trouble,
          },
        },
      },
    })
  end,
}
