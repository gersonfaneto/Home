local api = require("utils.api")

local M = {}

api.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>mp",
    rhs = ":MarkdownPreviewToggle<CR>",
    options = { noremap = true, silent = true },
    description = "Toggle markdown preview.",
  },
})

return M
