local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "TreeSJ: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n", "v" },
    lhs = "<leader>os",
    rhs = ":TSJSplit<CR>",
    options = props.options,
    description = props.prefix .. "Split the object at the current position/selection.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>oj",
    rhs = ":TSJJoin<CR>",
    options = props.options,
    description = props.prefix .. "Join the object at the current position/selection.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>ot",
    rhs = ":TSJToggle<CR>",
    options = props.options,
    description = props.prefix .. "Split/Join the object at the current position/selection.",
  },
})

return M
