return {
  "Wansmer/treesj",
  cmd = {
    "TSJSplit",
    "TSJJoin",
    "TSJToggle",
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local treesj = require("treesj")

    treesj.setup({
      use_default_keymaps = false,
    })
  end,
}
