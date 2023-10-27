local base = require("utils.base")

local splitjoin = require("splitjoin")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Split Join: "
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n", "v", "x" },
    lhs = "gJ",
    rhs = splitjoin.join,
    options = props.options,
    description = props.prefix .. "Join the object at the current position/selection.",
  },
  {
    mode = { "n", "v", "x" },
    lhs = "gS",
    rhs = splitjoin.split,
    options = props.options,
    description = props.prefix .. "Split the object at the current position/selection.",
  },
})

return M
