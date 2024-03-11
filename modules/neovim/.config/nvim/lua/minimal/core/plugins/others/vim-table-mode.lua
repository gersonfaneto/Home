local M = {
  "dhruvasagar/vim-table-mode",
  cmd = {
    "TableModeToggle",
  },
}

function M.init()
  M.helpers.register_mappings()
end

M.helpers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>tm",
        rhs = ":TableModeToggle<CR>",
        description = "Toggle.",
      },
      {
        mode = { "n" },
        lhs = "<leader>tr",
        rhs = ":TableModeRealign<CR>",
        description = "Realign.",
      },
      {
        mode = { "n" },
        lhs = "<leader>ts",
        rhs = ":TableSort<CR>",
        description = "Sort.",
      },
    }, { options = { silent = true, noremap = true }, prefix = "Table Mode :: " })
  end,
}

return M
