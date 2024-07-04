local M = {
  "neovim/nvim-lspconfig",
  cmd = {
    "LspInfo",
    "LspStart",
    "LspStop",
    "LspRestart",
  },
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  dependencies = {
    "williamboman/mason.nvim",
  },
}

local server_exceptions = {
  skip = {
    "jdtls",
  },
  codelens = {
    "ocamllsp",
  },
}

local attach_codelens = function(client)
  if client.supports_method("textDocument/codeLens") then
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
      group = vim.api.nvim_create_augroup("refreshCodelens", {}),
      buffer = 0,
      callback = vim.lsp.codelens.refresh,
    })
    vim.lsp.codelens.refresh()
  end
end

function M.config()
  local lspconfig = require("lspconfig")

  ---@diagnostic disable-next-line: deprecated
  local servers = vim.tbl_flatten({
    vim.tbl_keys(utils.types.packages.servers),
    utils.types.packages.external_servers,
  })

  for _, server in pairs(servers) do
    if vim.tbl_contains(server_exceptions.skip, server) then
      goto continue
    end

    local opts = {}

    if vim.tbl_contains(server_exceptions.codelens, server) then
      opts = {
        on_attach = function(client, bufnr)
          attach_codelens(client)
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

    local extensions = {
      custom = "custom.servers.",
      minimal = "minimal.core.plugins.code.core.servers.",
    }

    for _, override in pairs(extensions) do
      local found, settings = pcall(require, override .. server)

      if found then
        utils.base.tables.merge(opts, settings)
      end
    end

    lspconfig[server].setup(opts)

    ::continue::
  end
end

return M
