local api = require("utils.api")

local M = {}

api.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "[z",
    rhs = "zk",
    options = { noremap = true, silent = true },
    description = "Jump to next fold.",
  },
  {
    mode = { "n" },
    lhs = "]z",
    rhs = "zj",
    options = { noremap = true, silent = true },
    description = "Jump to previous fold.",
  },
  {
    mode = { "n" },
    lhs = "<leader>mp",
    rhs = ":MarkdownPreviewToggle<CR>",
    options = { noremap = true, silent = true },
    description = "Toggle markdown preview.",
  },
})

return M
