local base = require("utils.base")

local treesj = require("treesj")

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
    mode = { "n", "v", "x" },
    lhs = "gJ",
    rhs = treesj.join,
    options = props.options,
    description = props.prefix .. "Join the object at the current position/selection.",
  },
  {
    mode = { "n", "v", "x" },
    lhs = "gS",
    rhs = treesj.split,
    options = props.options,
    description = props.prefix .. "Split the object at the current position/selection.",
  },
  {
    mode = { "n", "v", "x" },
    lhs = "gA",
    rhs = treesj.toggle,
    options = props.options,
    description = props.prefix .. "Split/Join the object at the current position/selection.",
  },
})

return M
