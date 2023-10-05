return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local api = require("utils.api")

    local lint = require("lint")

    lint.linters_by_ft = {
      sh = { "shellcheck" },
      python = { "pylint" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    api.mappings.register({
      mode = { "n" },
      lhs = "<leader>tl",
      rhs = function()
        lint.try_lint()
      end,
      options = { silent = true, noremap = true },
      description = "Trigger linting for current file.",
    })
  end,
}
