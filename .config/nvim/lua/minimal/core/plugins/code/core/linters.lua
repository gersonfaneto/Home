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

  linters.linters_by_ft = {}

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      linters.try_lint()
    end,
  })
end

return M
