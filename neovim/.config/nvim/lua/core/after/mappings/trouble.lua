local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Trouble: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>xx",
    rhs = ":TroubleToggle<CR>",
    options = props.options,
    description = props.prefix .. "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xw",
    rhs = ":TroubleToggle workspace_diagnostics<CR>",
    options = props.options,
    description = props.prefix .. "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xd",
    rhs = ":TroubleToggle document_diagnostics<CR>",
    options = props.options,
    description = props.prefix .. "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xq",
    rhs = ":TroubleToggle quickfix<CR>",
    options = props.options,
    description = props.prefix .. "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xl",
    rhs = ":TroubleToggle loclist<CR>",
    options = props.options,
    description = props.prefix .. "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xr",
    rhs = ":TroubleToggle lsp_references<CR>",
    options = props.options,
    description = props.prefix .. "Toggle.",
  },
})

return M
