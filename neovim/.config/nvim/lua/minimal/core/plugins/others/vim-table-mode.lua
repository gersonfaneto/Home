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
    utils.base.mappings.register({
      mode = { "n" },
      lhs = "<leader>tm",
      rhs = ":TableModeToggle<CR>",
      options = { silent = true, noremap = true },
      description = "Table Mode :: Toggle",
    })
  end,
}

return M
