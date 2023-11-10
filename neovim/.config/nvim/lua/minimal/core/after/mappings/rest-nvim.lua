local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>hr",
    rhs = "<Plug>RestNvim",
    description = "Run request under cursor.",
  },
  {
    mode = { "n" },
    lhs = "<leader>hl",
    rhs = "<Plug>RestNvimLast",
    description = "Run last request.",
  },
  {
    mode = { "n" },
    lhs = "<leader>hp",
    rhs = "<Plug>RestNvimPreview",
    description = "Preview request under cursor.",
  },
}, { options = { silent = true, noremap = false }, prefix = "REST: " })

return M
