local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Noice: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nh",
    rhs = ":Noice telescope<CR>",
    options = props.options,
    description = props.prefix .. "Open notification history.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nc",
    rhs = ":Noice dismiss<CR>",
    options = props.options,
    description = props.prefix .. "Clear all notifications.",
  },
  {
    mode = { "n" },
    lhs = "<leader>np",
    rhs = ":Noice last<CR>",
    options = props.options,
    description = props.prefix .. "View last notification.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nd",
    rhs = ":Noice disable<CR>",
    options = props.options,
    description = props.prefix .. "Disable.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ne",
    rhs = ":Noice enable<CR>",
    options = props.options,
    description = props.prefix .. "Enable.",
  },
})

return M
