local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Diff View: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>do",
    rhs = ":DiffviewOpen<CR>",
    options = props.options,
    description = props.prefix .. "Open diff view.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dc",
    rhs = ":DiffviewClose<CR>",
    options = props.options,
    description = props.prefix .. "Close diff view.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dh",
    rhs = ":DiffviewFileHistory<CR>",
    options = props.options,
    description = props.prefix .. "Open diff history.",
  },
})

return M
