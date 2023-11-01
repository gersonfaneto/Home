local base = require("utils.base")

local dbee = require("dbee")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "DB: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>Do",
    rhs = dbee.open,
    options = props.options,
    description = props.prefix .. "Open UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dc",
    rhs = dbee.close,
    options = props.options,
    description = props.prefix .. "Close UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dt",
    rhs = dbee.toggle,
    options = props.options,
    description = props.prefix .. "Toggle UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dn",
    rhs = dbee.next,
    options = props.options,
    description = props.prefix .. "Go to next result page.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dp",
    rhs = dbee.prev,
    options = props.options,
    description = props.prefix .. "Go to previous result page.",
  },
})

return M
