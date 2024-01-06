return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    local servers = vim.tbl_flatten({
      vim.tbl_keys(utils.types.servers.base_languages),
      utils.types.servers.extra_languages,
    })

    for _, server in pairs(servers) do
      if server == "jdtls" then
        goto continue
      end

      local has_settings, extras = pcall(require, "minimal.core.plugins.coding.settings." .. server)

      local settings = {
        on_attach = utils.plugins.lsp.attach.on_attach,
        capabilities = utils.plugins.lsp.capabilities.default_capabilities(),
      }

      if has_settings then
        settings = utils.base.tables.merge(extras, settings)
      end

      lspconfig[server].setup(settings)

      ::continue::
    end
  end,
}
