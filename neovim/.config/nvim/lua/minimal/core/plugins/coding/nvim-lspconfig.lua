return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local base = require("minimal.utils.base")
    local types = require("minimal.utils.types")
    local plugins = require("minimal.utils.plugins")

    local servers = vim.tbl_flatten({
      types.servers.base_languages,
      types.servers.extra_languages,
    })

    for _, server in pairs(servers) do
      if server == "jdtls" then
        goto continue
      end

      local has_settings, extras = pcall(require, "minimal.plugins.coding.settings." .. server)

      local settings = {
        on_attach = plugins.lsp.attach.on_attach,
        capabilities = plugins.lsp.capabilities.default_capabilities(),
      }

      if has_settings then
        settings = base.tables.merge(extras, settings)
      end

      lspconfig[server].setup(settings)

      ::continue::
    end
  end,
}
