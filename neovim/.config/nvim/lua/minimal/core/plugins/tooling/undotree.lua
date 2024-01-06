return {
  "mbbill/undotree",
  cmd = {
    "UndotreeToggle",
    "UndotreeHide",
    "UndotreeShow",
    "UndotreeFocus",
  },
  config = function()
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_HighlightChangedWithSign = 0
  end,
}
