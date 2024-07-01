local M = {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local linters = require("lint")

  linters.linters_by_ft = utils.types.packages.linters

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      linters.try_lint()
    end,
  })

  utils.base.mappings.register({
    mode = { "n" },
    lhs = "<leader>lll",
    rhs = linters.try_lint,
    options = { silent = true, noremap = true },
    description = "Linters :: Run linters for current file.",
  })
end

return M
