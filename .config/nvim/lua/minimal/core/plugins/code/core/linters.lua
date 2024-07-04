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
  local lint = require("lint")

  lint.linters_by_ft = utils.types.packages.extensions.linters

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      lint.try_lint()
    end,
  })

  utils.base.mappings.register({
    mode = { "n" },
    lhs = "<leader>ltl",
    rhs = function()
      lint.try_lint()
    end,
    options = { silent = true, noremap = true },
    description = "Linters :: Run linters for current file.",
  })
end

return M
