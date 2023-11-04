return {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonToolInstall",
  },
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local types = require("utils.types")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = types.servers.languages.base,
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = vim.tbl_flatten({
        types.servers.general.linters,
        types.servers.general.formatters,
      }),
    })
  end,
}
