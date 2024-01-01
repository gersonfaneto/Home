return {
  "williamboman/mason.nvim",
  event = { "VeryLazy" },
  build = function()
    vim.api.nvim_command(":MasonUpdate")
  end,
  config = function()
    local mason = require("mason")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "rounded",
      },
    })
  end,
}
