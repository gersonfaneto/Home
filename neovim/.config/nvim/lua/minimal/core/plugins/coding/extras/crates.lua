return {
  "Saecki/crates.nvim",
  ft = { "rust", "toml" },
  event = {
    "BufRead",
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local crates = require("crates")

    crates.setup({
      src = {
        cmp = {
          enabled = true,
        },
      },
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
      popup = {
        border = "rounded",
      },
    })
  end,
}
