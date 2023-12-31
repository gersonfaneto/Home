local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "gD",
    rhs = ":Glance definitions<CR>",
    description = "View definitions.",
  },
  {
    mode = { "n" },
    lhs = "gR",
    rhs = ":Glance references<CR>",
    description = "View references.",
  },
  {
    mode = { "n" },
    lhs = "gY",
    rhs = ":Glance type_definitions<CR>",
    description = "View type definitions.",
  },
  {
    mode = { "n" },
    lhs = "gI",
    rhs = ":Glance implementations<CR>",
    description = "View implementations.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Glance: " })

return M
