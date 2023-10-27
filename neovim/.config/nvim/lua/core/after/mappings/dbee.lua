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
    lhs = "<leader>dbo",
    rhs = dbee.open,
    options = props.options,
    description = props.prefix .. "Open UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dbc",
    rhs = dbee.close,
    options = props.options,
    description = props.prefix .. "Close UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dbt",
    rhs = dbee.toggle,
    options = props.options,
    description = props.prefix .. "Toggle UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dbn",
    rhs = dbee.next,
    options = props.options,
    description = props.prefix .. "Go to next result page.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dbp",
    rhs = dbee.prev,
    options = props.options,
    description = props.prefix .. "Go to previous result page.",
  },
})

return M
