local M = {
  "folke/todo-comments.nvim",
  opts = {},
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  cmd = {
    "TodoLocList",
    "TodoQuickFix",
    "TodoTelescope",
    "TodoTrouble",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.init()
  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>tt",
      rhs = ":TodoQuickFix<CR>",
      description = "Browse TODOs using the Quick Fix.",
    },
  }, { prefix = "TODOs :: ", options = { noremap = true, silent = true } })
end

return M
