local base = require("utils.base")

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
    rhs = ":lua require('dbee').open()<CR>",
    options = props.options,
    description = props.prefix .. "Open UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dc",
    rhs = ":lua require('dbee').close()<CR>",
    options = props.options,
    description = props.prefix .. "Close UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dt",
    rhs = ":lua require('dbee').toggle()<CR>",
    options = props.options,
    description = props.prefix .. "Toggle UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dn",
    rhs = ":lua require('dbee').next()<CR>",
    options = props.options,
    description = props.prefix .. "Go to next result page.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dp",
    rhs = ":lua require('dbee').prev()<CR>",
    options = props.options,
    description = props.prefix .. "Go to previous result page.",
  },
})

return M
