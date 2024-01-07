local M = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  event = { "VeryLazy" },
}

function M.config()
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
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ms",
    rhs = ":Mason<CR>",
    description = "Open Mason.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Mason: " })

return M
