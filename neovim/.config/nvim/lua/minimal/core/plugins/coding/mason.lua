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

    local packages = vim.tbl_flatten({
      utils.types.servers.linters,
      utils.types.servers.formatters,
      vim.tbl_values(utils.types.servers.base_languages),
    })

    local registry = require("mason-registry")

    for _, package in pairs(packages) do
      package = registry.get_package(package)

      if not package:is_installed() then
        package:install()
      end
    end
  end,
}
