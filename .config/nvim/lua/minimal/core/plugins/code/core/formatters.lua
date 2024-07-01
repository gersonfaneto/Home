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
    formatters_by_ft = utils.types.packages.formatters,
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
      lhs = "<leader>lfe",
      rhs = function()
        vim.g.format_on_save = true
        vim.notify("Files will now be formatted upon save.", "info", { title = "Minimal" })
      end,
      description = "Enable format on save.",
    },
    {
      mode = { "n" },
      lhs = "<leader>lfd",
      rhs = function()
        vim.g.format_on_save = false
        vim.notify("Files will no longer be formatted upon save.", "warn", { title = "Minimal" })
      end,
      description = "Disable format on save.",
    },
    {
      mode = { "n", "x" },
      lhs = "<leader>lff",
      rhs = formatters.format,
      description = "Format current buffer.",
    },
  }, { options = { silent = true, noremap = true }, prefix = "Formatters :: " })
end

return M
