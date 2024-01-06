local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n", "v" },
    lhs = "<leader>os",
    rhs = ":TSJSplit<CR>",
    description = "Split the object at the current position/selection.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>oj",
    rhs = ":TSJJoin<CR>",
    description = "Join the object at the current position/selection.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>ot",
    rhs = ":TSJToggle<CR>",
    description = "Split/Join the object at the current position/selection.",
  },
}, { options = { silent = true, noremap = true }, prefix = "TreeSJ: " })

return M
