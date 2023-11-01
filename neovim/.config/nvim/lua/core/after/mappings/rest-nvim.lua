local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = false,
  },
  prefix = "REST: ",
}

local M = {}

base.mappings.bulk_register({
  {

    mode = { "n" },
    lhs = "<leader>hr",
    rhs = "<Plug>RestNvim",
    options = props.options,
    description = props.prefix .. "Run request under cursor.",
  },
  {

    mode = { "n" },
    lhs = "<leader>hl",
    rhs = "<Plug>RestNvimLast",
    options = props.options,
    description = props.prefix .. "Run last request.",
  },
  {

    mode = { "n" },
    lhs = "<leader>hp",
    rhs = "<Plug>RestNvimPreview",
    options = props.options,
    description = props.prefix .. "Preview request under cursor.",
  },
})

return M
