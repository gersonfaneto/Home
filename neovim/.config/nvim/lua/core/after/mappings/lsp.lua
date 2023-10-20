local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "LSP: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>li",
    rhs = ":LspInfo<CR>",
    options = props.options,
    description = props.prefix .. "Open the LSP Info.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ll",
    rhs = ":LspLog<CR>",
    options = props.options,
    description = props.prefix .. "Open the LSP Log.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ls",
    rhs = ":LspStart<CR>",
    options = props.options,
    description = props.prefix .. "Start the LSP.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lS",
    rhs = ":LspStop<CR>",
    options = props.options,
    description = props.prefix .. "Stop the LSP.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lr",
    rhs = ":LspRestart<CR>",
    options = props.options,
    description = props.prefix .. "Restart the LSP.",
  },
})

return M
