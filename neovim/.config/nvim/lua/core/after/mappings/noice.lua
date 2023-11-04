local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ne",
    rhs = ":Noice enable<CR>",
    description = "Enable.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nd",
    rhs = ":Noice disable<CR>",
    description = "Disable.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nh",
    rhs = ":Noice telescope<CR>",
    description = "Open notification history.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nc",
    rhs = ":Noice dismiss<CR>",
    description = "Clear all notifications.",
  },
  {
    mode = { "n" },
    lhs = "<leader>np",
    rhs = ":Noice last<CR>",
    description = "View last notification.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Noice: " })

return M
