local opts = { buffer = nil, silent = true, noremap = true }

local mappings = require("utils.api").mappings

local M = {}

mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>lf",
    rhs = ":GoFmt<CR>",
    options = opts,
    description = "Go - Format (GoFmt).",
  },
  {
    mode = { "n" },
    lhs = "<leader>aj",
    rhs = ":GoTagAdd json<CR>",
    options = opts,
    description = "Go - Add JSON tag.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rj",
    rhs = ":GoTagRm json<CR>",
    options = opts,
    description = "Go - Remove JSON tag.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ay",
    rhs = ":GoTagAdd yaml<CR>",
    options = opts,
    description = "Go - Add YAML tag.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ry",
    rhs = ":GoTagRm yaml<CR>",
    options = opts,
    description = "Go - Remove YAML tag.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ge",
    rhs = ":GoIfErr<CR>",
    options = opts,
    description = "Go - Generate `if err`.",
  },
})

return M
