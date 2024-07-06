local M = {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "williamboman/mason.nvim",
  },
}

vim.g.format_on_save = vim.g.format_on_save or utils.types.settings.format_on_save

function M.config()
  local formatters = require("conform")

  formatters.setup({
    formatters_by_ft = utils.types.packages.extensions.formatters,
    format_on_save = function(_)
      if not vim.g.format_on_save then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
  })

  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<localleader>fe",
      rhs = function()
        vim.g.format_on_save = true
        vim.notify("Files will now be formatted upon save.", "info", { title = "Minimal" })
      end,
      description = "Enable format on save.",
    },
    {
      mode = { "n" },
      lhs = "<localleader>fd",
      rhs = function()
        vim.g.format_on_save = false
        vim.notify("Files will no longer be formatted upon save.", "warn", { title = "Minimal" })
      end,
      description = "Disable format on save.",
    },
    {
      mode = { "n", "x" },
      lhs = "<localleader>fr",
      rhs = function()
        formatters.format({
          lsp_format = "fallback",
        })
      end,
      description = "Run formatters for on buffer.",
    },
  }, { options = { silent = true, noremap = true }, prefix = "Formatters :: " })
end

return M
