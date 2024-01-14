local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/neodev.nvim",
      ft = { "lua" },
      opts = {},
      priority = 100,
    },
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local lspconfig = require("lspconfig")

  local servers = vim.tbl_flatten({
    vim.tbl_keys(utils.types.servers.base_languages),
    utils.types.servers.extra_languages,
  })

  for _, server in pairs(servers) do
    if vim.tbl_contains(M.server_exceptions.skip, server) then
      goto continue
    end

    local settings = "minimal.core.plugins.coding.core.servers."
    local has_settings, extras = pcall(require, settings .. server)

    local opts = {}

    if vim.tbl_contains(M.server_exceptions.codeless, server) then
      opts = {
        on_attach = function(client, bufnr)
          M.handlers.attach_codelens(client)
          utils.plugins.lsp.attach.on_attach(client, bufnr)
        end,
        capabilities = utils.plugins.lsp.capabilities.default_capabilities(),
      }
    else
      opts = {
        on_attach = utils.plugins.lsp.attach.on_attach,
        capabilities = utils.plugins.lsp.capabilities.default_capabilities(),
      }
    end

    if has_settings then
      opts = utils.base.tables.merge(extras, opts)
    end

    lspconfig[server].setup(opts)

    ::continue::
  end
end

M.server_exceptions = {
  skip = {
    "jdtls",
  },
  codeless = {
    "ocamllsp",
    "rust_analyzer",
  },
}

M.handlers = {
  attach_codelens = function(client)
    if client.supports_method("textDocument/codeLens") then
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
        group = vim.api.nvim_create_augroup("refreshCodelens", {}),
        buffer = 0,
        callback = vim.lsp.codelens.refresh,
      })

      vim.lsp.codelens.refresh()
    end
  end,
}

return M
