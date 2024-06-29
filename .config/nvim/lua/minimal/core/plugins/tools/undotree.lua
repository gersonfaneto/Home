local M = {
  "mbbill/undotree",
  cmd = {
    "UndotreeToggle",
    "UndotreeHide",
    "UndotreeShow",
    "UndotreeFocus",
  },
}

function M.config()
  vim.g.undotree_WindowLayout = 4
  vim.g.undotree_SetFocusWhenToggle = 1
  vim.g.undotree_HighlightChangedWithSign = 0
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "U",
    rhs = ":UndotreeToggle<CR>",
    description = "Toggle.",
  },
}, { options = { silent = true, noremap = true }, prefix = "UndoTree :: " })

return M
